Quando('o usuário entrar para fazer o checkout') do
    @checkout_page = Pages::Checkout.new
    @checkout_page.load
end
  
Então('deverá ser encontrado os campos') do
    expect(@checkout_page.check_items).to have_input_first_name
    expect(@checkout_page.check_items).to have_input_last_name
    expect(@checkout_page.check_items).to have_input_zip_code
end
  
Quando('o usuário adiciona um item ao carrinho') do
    @product_name, @product_price = @home_page.add_product_get_name_and_price
end
  
E('entra no carrinho e prossegue para o checkout') do
    @cart_page = Pages::Cart.new
    @cart_page.load
    @cart_page.cart_items.go_to_checkout_cart
end
  
E('o usuário realizar o checkout bem-sucedido com informações válidas') do
    @checkout_page = Pages::Checkout.new
    @checkout_page.load
    checkout_data = Factory::Dynamic.checkout_your_information
    @checkout_page.send_information(checkout_data)
end
  
Então('deverá ser direcionado para a finalização da compra') do
    expect(current_url).to eq 'https://www.saucedemo.com/checkout-step-two.html'
end

E('o usuário realizar o checkout com as informações em branco') do
    @checkout_page = Pages::Checkout.new
    @checkout_page.load
    @checkout_page.check_items.blank_inputs
  end
  
Quando('o usuário estiver na página de checkout') do
    @checkout_page = Pages::Checkout.new
    @checkout_page.load
end
  
E('o usuário clicar em cancelar') do
    @checkout_page.check_items.cancel_button.click
end
  
Então('deverá ser direcionado para o carrinho de compras') do
    expect(current_url).to eq 'https://www.saucedemo.com/cart.html'
end