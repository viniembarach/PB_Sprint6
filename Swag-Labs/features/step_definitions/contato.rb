Quando('entrar em contato pelo Twitter') do
    @home_page.footer.go_twitter
end
  
Então('deverá ser direcionado para a página no Twitter') do
    page.driver.browser.switch_to.window(page.driver.browser.window_handles[1])
    sleep 2
    expect(current_url).to eq 'https://twitter.com/saucelabs'
end
  
Quando('entrar em contato pelo Facebook') do
    @home_page.footer.go_facebook
end
  
Então('deverá ser direcionado para a página do Facebook') do
    page.driver.browser.switch_to.window(page.driver.browser.window_handles[1])
    sleep 2
    expect(current_url).to eq 'https://www.facebook.com/saucelabs'
end
  
Quando('entrar em contato pelo LinkedIn') do
    @home_page.footer.go_linkedin
end
  
Então('deverá ser direcionado para a página do LinkedIn') do
    page.driver.browser.switch_to.window(page.driver.browser.window_handles[1])
    sleep 2
    expect(current_url).to eq 'https://www.linkedin.com/company/sauce-labs/'
end