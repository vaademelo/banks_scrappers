class NubankScrapper < BaseScrapper
  def initialize
    visit_url('https://app.nubank.com.br/#/login')
  end
  #args: {login: <>, password: <>, account: <>}
  def scrape(args = {})
    @args = args
    login(args[:login], args[:password])
    fetch_bills
  end

  private

  def login(login, password)
    browser.fill_in('cpf', with: login)
    browser.fill_in('senha', with: password)
    browser.click_button('entrar')
  end

  def fetch_bills
    browser.click_link('Faturas')

    browser.all(:css, '.md-header md-tab').each do |bill|
      account =
      amount  = bill.find(:css, '.amount').text.gsub(/([^0-9])/, '').to_i
      period  = bill.find(:css, '.period').text

      @nubank_bill   = Bill.find_by(period: parse_period(period))
      @nubank_bill ||= Bill.new(account: @args[:account],
                                amount: amount,
                                period: parse_period(period))

      fetch_charges(bill)
    end
  end

  def fetch_charges(bill)

    # Wait for resource to be loaded
    browser.has_content?('Valores em R$')

    browser.execute_script("$('.md-header-items-container').css('overflow','visible')")
    sleep(3)
    browser.execute_script("$('.md-header-items').css('transform','none')")


    bill.click

    # Wait for resource to be loaded
    sleep(3)

    browser.all(:css, '.charge').each do |charge|
      date = charge.find(:css, '.date').text.split(' ').first
      description = charge.find(:css, '.description').text
      amount = charge.find(:css, '.amount').text.gsub(/([^0-9])/, '').to_i

      if @nubank_bill.charges.where(date: date, description: description, amount: amount).blank?
        @nubank_bill.charges.build(date: date,
                                   description: description,
                                   amount: amount)
      end
    end

    @nubank_bill.save!
  end

  def parse_period(period)
    if period.length == 3
      "#{Time.now.year}-#{MONTHS_TRANSLATIONS[period]}"
    else
      "20#{period.split(' ').last}-#{MONTHS_TRANSLATIONS[period.split(' ').first]}"
    end
  end
end
