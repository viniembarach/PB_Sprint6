#language: pt

@regression
@login
Funcionalidade: Login
    COMO usuário do Ecommerce Swag Labs
    QUERO poder realizar login
    PARA poder realizar minhas compras

    Contexto: Estar no site 
        Dado que o usuário abriu o Swag Labs no navegador

    @login_standard_user
    Cenário: Login com usuário padrão
        Quando o usuário insere o username e a senha corretos e prossegue com o login
        Então deverá acessar os produtos do ecommerce

    @login_locked_out_user
    Cenário: Tentativa de login com usuário bloqueado
        Quando o usuário insere o username bloqueado e a senha correta e prossegue com o login
        Então deverá mostrar a mensagem "Epic sadface: Sorry, this user has been locked out."

    @login_problem_user
    Cenário: Tentativa de login com usuário com problema
        Quando o usuário insere o username com problema e a senha correta e prossegue com o login
        Então deverá acessar os produtos do ecommerce
    
    @login_performance_glitch_user
    Cenário: Tentativa de login com usuário com problemas de performance 
        Quando o usuário insere o username com problemas de performance e a senha correta e prossegue com o login
        Então deverá acessar os produtos do ecommerce

    @login_validation_failure
    Cenário: Tentativa de login com senha inválida
        Quando o usuário insere um username válido e a senha inválida e prossegue com o login
        Então deverá mostrar a mensagem "Epic sadface: Username and password do not match any user in this service"
    
    @login_invalid_user
    Cenário: Tentativa de login com username inválido
        Quando o usuário insere um username inválido e a senha válida e prossegue com o login
        Então deverá mostrar a mensagem "Epic sadface: Username and password do not match any user in this service"

    @login_empty
    Cenário: Tentativa de login com campos em branco 
        Quando o usuário não insere nenhum dos campos e prossegue com o login
        Então deverá mostrar a mensagem "Epic sadface: Username is required"