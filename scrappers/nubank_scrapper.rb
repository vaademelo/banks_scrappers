class NubankScrapper < BaseScrapper
  def initialize
    visit_url('https://app.nubank.com.br/#/login')
  end

  def scrape
    login
    browser.save_and_open_page
  end

  private

  def login
    browser.fill_in('cpf', with: ENV['NUBANK_LOGIN'])
    browser.fill_in('senha', with: ENV['NUBANK_PASSWORD'])
    browser.click_on('entrar')
  end
end
