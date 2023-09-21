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
        Quando o usuário adiciona um item ao carrinho
        E entra no carrinho e prossegue para o checkout
        E o usuário realizar o checkout bem-sucedido com informações válidas
        Então deverá ser direcionado para a finalização da compra

    @wip
    @blank_fields_checkout
    Cenário: Realizar checkout com informações em branco
        Quando o usuário adiciona um item ao carrinho
        E entra no carrinho e prossegue para o checkout
        E o usuário realizar o checkout com as informações em branco
        Então deverá ser direcionado para a finalização da compra

    @back_to_cart
    Cenário: Voltar ao carrinho a partir da página de checkout
        Quando o usuário estiver na página de checkout
        E o usuário clicar em cancelar
        Então deverá ser direcionado para o carrinho de compras
