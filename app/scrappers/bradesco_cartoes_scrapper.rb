class BradescoCartoesScrapper < BaseScrapper
  def initialize
    visit_url('https://banco.bradesco/html/classic/produtos-servicos/cartoes/index.shtm')
  end
  
  #args: {login: <>, password: <>, account: <>}
  def scrape(args = {})
    @args = args
    
    login(args[:login], args[:password])
    fetch_bills
  end

  private

  def login(login, password)
    browser.fill_in('CPF', with: login)
    browser.first("[title='Entrar'][tabindex='15']").click
    
    sleep(3)
    0..@args[:password].length.times do |index|
      browser.execute_script("$('#paginaCentral').contents().find(\".btnNumericTecladoVirtual[title='#{@args[:password][index]}']\").click()  ")
    end

    browser.execute_script("$('#paginaCentral').contents().find('[title=Avançar]').click()")
  end

  def fetch_bills
    sleep(3)
    browser.within_frame('paginaCentral') do
      browser.click_link 'Extratos'
      sleep(3)
      browser.find('a[title="Extrato Fechado Pressione Enter para selecionar."]').click
      sleep(3)
      browser.all(:css, '.linksPeriodosFechados li') do |bill|
        bill.click
        sleep(3)
        
        period = bill.find(:css, 'span:not(.seta_baixo)').text
        amount = browser.find(:css, '.valorTotalRecolhido').text.gsub(/([^0-9])/, '').to_i

        @bradesco_cartoes_bill   = Bill.find_by(period: parse_period(period), account: @args[:account])
        @bradesco_cartoes_bill ||= Bill.new(account: @args[:account],
                                            amount: amount,
                                            period: parse_period(period))

        fetch_charges
        @bradesco_cartoes_bill.save!
      end
    end
  end

  def fetch_charges
    browser.find('.expansor.topb').click
    sleep(3)
    browser.all(:css, '.rowNormal').each do |charge|
      
      charge_info = charge.all(:css, 'td')

      date        = charge_info[0].find(:css, 'span').text.split('/').first
      description = charge_info[1].find(:css, 'span').text
      amount      = charge_info[3].find(:css, 'span').text.gsub(/([^0-9])/, '').to_i

      if @bradesco_cartoes_bill.charges.where(date: date, description: description, amount: amount).blank?
        @bradesco_cartoes_bill.charges.build(date: date,
                                            description: description,
                                            amount: amount)
      end
    end
  end

  def parse_period(period)
    "20#{period.split('/').last}-#{MONTHS_TRANSLATIONS[period.split('/').first.upcase]}"
  end
end

