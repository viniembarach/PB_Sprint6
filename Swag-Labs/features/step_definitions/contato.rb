Dado('que esteja na home') do
    @home_page = Pages::Home.new
    @home_page.load
end
  
E('esteja logado') do
    user_data = Factory::Static.static_data('standard_user')
    @home_page.login_page.input_username_and_password_for_login(user_data['username'], user_data['password'])
    page.should have_selector('div.app_logo', text: 'Swag Labs')
end
  
Quando('entrar em contato pelo Twitter') do
    click_link('Twitter')
end
  
Então('deverá ser direcionado para a página no Twitter') do
    page.driver.browser.switch_to.window(page.driver.browser.window_handles[1])
    expect(current_url).to eq 'https://twitter.com/saucelabs'
end
  
Quando('entrar em contato pelo Facebook') do
    click_link('Facebook')
end
  
Então('deverá ser direcionado para a página do Facebook') do
    page.driver.browser.switch_to.window(page.driver.browser.window_handles[1])
    expect(current_url).to eq 'https://www.facebook.com/saucelabs'
end
  
Quando('entrar em contato pelo LinkedIn') do
    click_link('LinkedIn')
end
  
Então('deverá ser direcionado para a página do LinkedIn') do
    page.driver.browser.switch_to.window(page.driver.browser.window_handles[1])
    expect(current_url).to eq 'https://www.linkedin.com/company/sauce-labs/'
end