Quando('o usuário estiver no carrinho ou em outra pagina') do
    @cart_page = Pages::Cart.new
    @cart_page.load
end
  
E('abre o menu') do
    @cart_page.header.open_menu
end
  
E('clica em All Items') do
    @cart_page.header.back_to_home
end
  
Quando('o usuário abre o menu') do
    @home_page.header.open_menu
end
  
E('clica em About') do
    @home_page.header.about
end
  
Então('deverá ser direcionado para a pagina About') do
    expect(current_url).to eq 'https://saucelabs.com/'
end
  
E('clica em Logout') do
    @home_page.header.logout
end
  
Então('deverá ser direcionado para a pagina de login') do
    expect(page).to have_field('user-name')
    expect(page).to have_field('password')
end
  
Quando('o usuário estiver com um item no carrinho') do
    @home_page.add_product_get_name_and_price
    @cart_page = Pages::Cart.new
    @cart_page.load
end
  
E('clica em Reset App State') do
    @home_page.header.reset_app
end
  
Então('deverá resetar o aplicativo') do
    @cart_page = Pages::Cart.new
    @cart_page.load
    expect(@cart_page.cart_items.check_cart_empty).to be true
end