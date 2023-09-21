module Sections
    class Login_page < SitePrism::Section
        element :input_username, '#user-name'
        element :input_password, '#password'
        element :input_login,    '#login-button'
    
        def input_username_and_password_for_login(username, password)
            input_username.set username
            input_password.set password
            input_login.click
        end
    end
end