#language: pt

@regression
@completion
Funcionalidade: Finalização
    
    Contexto: Estar na home
        Dado que esteja na home
        E esteja logado

    @validate_completion
    Cenário: Validar itens na finalização da compra
        Quando o usuário adiciona um item ao carrinho
        E entra no carrinho e prossegue para o checkout
        E o usuário realizar o checkout bem-sucedido com informações válidas
        Então deverá ser exibido o resumo da compra

    @back_to_home
    Cenário: Voltar a home pela página da finalização
        Quando o usuário estiver na página de finalização
        E o usuário clicar em cancelar na finalização
        Então deverá ser direcionado para a home

    @success_completion
    Cenário: Finalizar compra com sucesso
        Quando o usuário adiciona um item ao carrinho
        E entra no carrinho e prossegue para o checkout
        E o usuário realizar o checkout bem-sucedido com informações válidas
        E conferir o resumo na finalização e finalizar a compra
        Então deverá ser realizada a compra com sucesso