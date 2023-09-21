#language: pt

@regression
@menu
Funcionalidade: Menu
    
    Contexto: Estar na home
        Dado que esteja na home
        E esteja logado

    @navigate_all_items
    Cenário: Navegar para a pagina All Items
        Quando o usuário estiver no carrinho ou em outra pagina
        E abre o menu
        E clica em All Items
        Então deverá ser direcionado para a home

    @navigate_about
    Cenário: Navegar para About
        Quando o usuário abre o menu
        E clica em About
        Então deverá ser direcionado para a pagina About

    @logout
    Cenário: Fazer Logout
        Quando o usuário abre o menu
        E clica em Logout
        Então deverá ser direcionado para a pagina de login

    @reset_app
    Cenário: Resetar o Estado do aplicativo
        Quando o usuário estiver com um item no carrinho
        E abre o menu
        E clica em Reset App State
        Então deverá resetar o aplicativo