class NubankScrapper < BaseScrapper
  def initialize
    visit_url('https://app.nubank.com.br/#/login')
  end

  def scrape
    login
    open_bills
  end

  private

  def login
    browser.fill_in('cpf', with: ENV['NUBANK_LOGIN'])
    browser.fill_in('senha', with: ENV['NUBANK_PASSWORD'])
    browser.click_button('entrar')
  end

  def open_bills
    browser.click_link('Faturas')

    browser.all(:css, '.md-header md-tab').each do |bill|
      amount = bill.find(:css, '.amount').text
      period = bill.find(:css, '.period').text

      @nubank_bill = NubankBill.new(amount: amount,
                                    period: parse_period(period),
                                    charges: [])

      get_bill_expenses(bill)
      byebug
    end
  end

  def get_bill_expenses(bill)

    # Wait for resource to be loaded
    browser.has_content?('Valores em R$')

    browser.execute_script("$('.md-header-items-container').css('overflow','visible')")
    sleep(3)
    browser.execute_script("$('.md-header-items').css('transform','none')")


    bill.click

    # Wait for resource to be loaded
    sleep(3)

    browser.all(:css, '.charge').each do |charge|
      byebug
      @nubank_bill.charges << Charge.new(date: charge.find(:css, '.date').text.split(' ').first,
                                         description: charge.find(:css, '.description').text,
                                         amount: Money.new(charge.find(:css, '.amount').text.gsub(/[,.]/, '').to_i, 'BRL'))
    end
  end

  def parse_period(period)
    if period.length == 3
      "#{Time.now.year}_#{MONTHS_TRANSLATIONS[period]}"
    else
      "20#{period.split(' ').last}_#{MONTHS_TRANSLATIONS[period.split(' ').first]}"
    end
  end
end
