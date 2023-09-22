Dado('que esteja na home') do
    @home_page = Pages::Home.new
    @home_page.load
end
  
E('esteja logado') do
    user_data = Factory::Static.static_data('standard_user')
    @home_page.login_page.input_username_and_password_for_login(user_data['username'], user_data['password'])
    expect(@home_page.header.logo_text).to eq 'Swag Labs'
end

Quando('aplicar o filtro de A a Z na vitrine') do
    @original_product_names = @home_page.product_items.get_product_names
    @home_page.header.select_filter_option('Name (A to Z)')
    @filtered_product_names = @home_page.product_items.get_product_names
end
  
Então('a vitrine deverá exibir os produtos em ordem alfabética de A a Z') do
    expect(@filtered_product_names).to eq(@original_product_names.sort)
end
  
Quando('aplicar o filtro de Z a A na vitrine') do
    @original_product_names = @home_page.product_items.get_product_names
    @home_page.header.select_filter_option('Name (Z to A)')
    @filtered_product_names = @home_page.product_items.get_product_names
end
  
Então('a vitrine deverá exibir os produtos em ordem alfabética de Z a A') do
    expect(@filtered_product_names).to eq(@original_product_names.sort { |a, b| b <=> a })
end

Quando('adicionar um produto pela vitrine') do
    @product_name, @product_price = @home_page.add_product_get_name_and_price
end
                                                                   
Então('o produto deverá ser adicinado ao carrinho') do
    @cart_page = Pages::Cart.new
    @cart_page.load
    cart_name, cart_price = @cart_page.cart_items.get_name_and_price_cart
    expect(@product_name).to  eq(cart_name)
    expect(@product_price).to eq(cart_price)
end
                                                                               
Quando('o usuário ja tiver um produto adicionado ao carrinho') do            
    @product_name, @product_price = @home_page.add_product_get_name_and_price
    @cart_page = Pages::Cart.new
    @cart_page.load
    cart_name, cart_price = @cart_page.cart_items.get_name_and_price_cart
    expect(@product_name).to  eq(cart_name)
    expect(@product_price).to eq(cart_price)
end
                                                                               
E('apertar para remover ele') do
    @home_page = Pages::Home.new
    @home_page.load
    @home_page.remove_product
end
                                                                               
Então('o produto deverá ser retirado do carrinho') do
    @cart_page = Pages::Cart.new
    @cart_page.load
    expect(@cart_page.cart_items.check_cart_empty).to be true
end

Quando('adicionar um produto pela PDP') do
    @product_name, @product_price = @home_page.go_add_product_get_name_and_price_pdp
end

E('apertar para remover ele pela PDP') do
    @home_page = Pages::Home.new
    @home_page.load
    @home_page.remove_product_pdp
end

Quando('o usuário estiver na página de um produto') do
    @home_page.product_items.go_to_pdp.click
end
  
E('voltar para os produtos') do
    @home_page.header.back_to_home_pdp.click
end
  
Então('deverá ser direcionado para a home') do
    expect(current_url).to eq 'https://www.saucedemo.com/inventory.html'
end