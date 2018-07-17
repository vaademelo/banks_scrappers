class BaseScrapper
  attr_accessor :browser

  def visit_url(url)
    @browser ||= Capybara.current_session

    @browser.visit(url)
  end
end
