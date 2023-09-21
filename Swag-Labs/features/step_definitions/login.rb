Dado('que o usuário abriu o Swag Labs no navegador') do
    @home_page = Pages::Home.new
    @home_page.load
end

Quando('o usuário entrar para fazer o login') do
    @home_page.load
end

Então('deverá haver os campos e o botão de login') do
    expect(@home_page.login_page).to have_input_username
    expect(@home_page.login_page).to have_input_password
    expect(@home_page.login_page).to have_input_login
end

Quando('o usuário insere o username e a senha corretos e prossegue com o login') do
    user_data = Factory::Static.static_data('standard_user')
    @home_page.login_page.input_username_and_password_for_login(user_data['username'], user_data['password'])
end

Então('deverá acessar os produtos do ecommerce') do
    expect(page).to have_selector('div.app_logo', text: 'Swag Labs')
  end
  
Quando('o usuário insere o username bloqueado e a senha correta e prossegue com o login') do
    user_data = Factory::Static.static_data('locked_out_user')
    @home_page.login_page.input_username_and_password_for_login(user_data['username'], user_data['password'])
end
  
Então('deverá mostrar a mensagem {string}') do |message|                      
    expect(page).to have_css('h3[data-test="error"]', text: message)
end                                                                          
  
Quando('o usuário insere o username com problema e a senha correta e prossegue com o login') do
    user_data = Factory::Static.static_data('problem_user')
    @home_page.login_page.input_username_and_password_for_login(user_data['username'], user_data['password'])
end
  
Quando('o usuário insere o username com problemas de performance e a senha correta e prossegue com o login') do
    user_data = Factory::Static.static_data('performance_glitch_user')
    @home_page.login_page.input_username_and_password_for_login(user_data['username'], user_data['password'])
end

Quando('o usuário insere um username válido e a senha inválida e prossegue com o login') do
    user_data = Factory::Static.static_data('login_validation_failure')
    @home_page.login_page.input_username_and_password_for_login(user_data['username'], user_data['password'])          
end                                                                                        
                                                                                             
Quando('o usuário insere um username inválido e a senha válida e prossegue com o login') do
    user_data = Factory::Static.static_data('invalid_user')
    @home_page.login_page.input_username_and_password_for_login(user_data['username'], user_data['password'])           
end                                                                                        
                                                                                             
Quando('o usuário não insere nenhum dos campos e prossegue com o login') do
    @home_page.login_page.input_login.click
end                                                                                        