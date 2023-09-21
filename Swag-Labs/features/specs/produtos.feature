#language: pt

@regression
@products
Funcionalidade: Produtos
    
    Contexto: Estar na home
        Dado que esteja na home
        E esteja logado

    @filter_a_to_z
    Cenário: Filtrar produtos de A a Z
        Quando aplicar o filtro de A a Z na vitrine
        Então a vitrine deverá exibir os produtos em ordem alfabética de A a Z

    @filter_z_to_a
    Cenário: Filtrar produtos de Z a A
        Quando aplicar o filtro de Z a A na vitrine
        Então a vitrine deverá exibir os produtos em ordem alfabética de Z a A

    @add_showcase_product
    Cenário: Adicionar produto pela vitrine
        Quando adicionar um produto pela vitrine
        Então o produto deverá ser adicinado ao carrinho
    
    @remove_showcase_product
    Cenário: Remover produto pela vitrine
        Quando o usuário ja tiver um produto adicionado ao carrinho
        E apertar para remover ele
        Então o produto deverá ser retirado do carrinho
    
    @add_product_pdp
    Cenário: Adicionar produto pela PDP
        Quando adicionar um produto pela PDP
        Então o produto deverá ser adicinado ao carrinho
    
    @remove_product_pdp
    Cenário: Remover produto pela PDP
        Quando o usuário ja tiver um produto adicionado ao carrinho
        E apertar para remover ele pela PDP
        Então o produto deverá ser retirado do carrinho

    @back_to_home_pdp
    Cenário: Voltar para a home pela PDP
        Quando o usuário estiver na página de um produto
        E voltar para os produtos
        Então deverá ser direcionado para a home 