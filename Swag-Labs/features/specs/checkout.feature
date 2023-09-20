#language: pt

@regression
@checkout
Funcionalidade: Checkout
    
    Contexto: Estar na home
        Dado que esteja na home
        E esteja logado

    @validate_fields_checkout
    Cenário: Validar campos do checkout
        Quando o usuário entrar para fazer o checkout
        E os campos estiverem vazios
        Então deverá ser encontrado os campos

    @success_checkout
    Cenário: Realizar checkout bem-sucedido com informações válidas
        Quando o usuário realizar o checkout bem-sucedido com informações válidas
        E conferir o item adicionado no passo dois do checkout
        Então deverá ser direcionado para a finalização da compra

    @wip
    @blank_fields_checkout
    Cenário: Tentativa de checkout com informações em branco;
        Quando o usuário realizar o checkout com as informações em branco
        E o usuário clicar em continuar para o passo dois
        Então deverá ser direcionado para o passo dois do checkout

    @back_to_cart
    Cenário: Voltar ao carrinho a partir da página de checkout;
        Quando o usuário estiver na página de checkout
        E o usuário clicar em cancelar
        Então deverá ser direcionado para o carrinho de compras
