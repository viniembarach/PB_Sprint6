Quando('acessar o icone do carrinho') do
    @home_page.header.cart_button.click
end
  
Então('deverá ser direcionado para a pagina do carrinho') do
    expect(current_url).to eq 'https://www.saucedemo.com/cart.html'
end
  
Quando('acessar o carrinho com um produto nele') do
    @product_name, @product_price = @home_page.add_product_get_name_and_price
    @cart_page = Pages::Cart.new
    @cart_page.load
    cart_name, cart_price = @cart_page.cart_items.get_name_and_price_cart
    expect(@product_name).to  eq(cart_name)
    expect(@product_price).to eq(cart_price)
end
  
E('o usuário remover ele pelo carrinho') do
    @cart_page.cart_items.remove_product_cart
end
  
Então('deverá ser retirado do carrinho') do
    expect(@cart_page.cart_items.check_cart_empty).to be true
end
  
Quando('o usuário tiver mais que um produto no carrinho') do
    @home_page.add_and_cart_icon_check
end
  
Então('o número no icone do carrinho deverá ser o mesmo de itens no carrinho') do
    @cart_page = Pages::Cart.new
    @cart_page.load
    cart_item_count = @cart_page.cart_items.count_cart
    icon_cart_count = @cart_page.get_icon_cart_count
    expect(icon_cart_count).to eq(cart_item_count)
  end
  
Quando('acessar o carrinho') do
    @cart_page = Pages::Cart.new
    @cart_page.load
end
  
E('o usuário clicar em continua comprando') do
    @cart_page.cart_items.continue_shopping_cart
end
  
Então('deverá ser direcionado a vitrine') do
    expect(current_url).to eq 'https://www.saucedemo.com/inventory.html'
end
  
Quando('o usuário tiver um item no carrinho') do
    @product_name, @product_price = @home_page.add_product_get_name_and_price
    @cart_page = Pages::Cart.new
    @cart_page.load
    cart_name, cart_price = @cart_page.cart_items.get_name_and_price_cart
    expect(@product_name).to  eq(cart_name)
    expect(@product_price).to eq(cart_price)
end
  
E('continuar para o checkout') do
    @cart_page.cart_items.go_to_checkout_cart
end
  
Então('deverá ser direcionado a pagina de checkout') do
    expect(current_url).to eq 'https://www.saucedemo.com/checkout-step-one.html'
end