#language: pt

@regression
@cart
Funcionalidade: Carrinho
    
    Contexto: Estar na home
        Dado que esteja na home
        E esteja logado

    @access_cart
    Cenário: Acessar o carrinho
        Quando acessar o icone do carrinho
        Então deverá ser direcionado para a pagina do carrinho

    @remove_product_cart
    Cenário: Remover produto pelo carrinho
        Quando acessar o carrinho com um produto nele
        E o usuário remover ele pelo carrinho
        Então deverá ser retirado do carrinho
    
    @quantity_icon_cart
    Cenário: Verificar quantidade do icone do carrinho
        Quando o usuário tiver mais que um produto no carrinho
        Então o número no icone do carrinho deverá ser o mesmo de itens no carrinho

    @keep_shopping_cart
    Cenário: Verificar redirecionamento do link Continue comprando
        Quando acessar o carrinho
        E o usuário clicar em continua comprando
        Então deverá ser direcionado a vitrine

    @go_to_checkout_cart
    Cenário: Continuar para o checkout
        Quando o usuário tiver um item no carrinho
        E continuar para o checkout
        Então deverá ser direcionado a pagina de checkout 

    