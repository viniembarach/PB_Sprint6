#language: pt

@regression
@contact
Funcionalidade: Contato
    
    Contexto: Estar na home
        Dado que esteja na home
        E esteja logado
    
    @contact_twitter
    Cenário: Entrar em contato pelo Twitter
        Quando entrar em contato pelo Twitter
        Então deverá ser direcionado para a página no Twitter

    @contact_facebook
    Cenário: Entrar em contato pelo Facebook
        Quando entrar em contato pelo Facebook
        Então deverá ser direcionado para a página do Facebook
    
    @contact_linkedin
    Cenário: Entrar em contato pelo LinkedIn
        Quando entrar em contato pelo LinkedIn
        Então deverá ser direcionado para a página do LinkedIn