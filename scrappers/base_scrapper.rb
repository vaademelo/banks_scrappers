class BaseScrapper
  attr_accessor :browser

  MONTHS_TRANSLATIONS = { 'JAN' => '01',
                          'FEV' => '02',
                          'MAR' => '03',
                          'ABR' => '04',
                          'MAI' => '05',
                          'JUN' => '06',
                          'JUL' => '07',
                          'AGO' => '08',
                          'SET' => '09',
                          'OUT' => '10',
                          'NOV' => '11',
                          'DEZ' => '12' }

  def visit_url(url)
    @browser ||= Capybara.current_session

    @browser.visit(url)
  end
end
