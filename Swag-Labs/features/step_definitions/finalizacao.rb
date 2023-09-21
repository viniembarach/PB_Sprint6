Então('deverá ser exibido o resumo da compra') do
    @completion_page = Pages::Completion.new
    @completion_page.load
    completion_name, completion_price = @completion_page.checkout_completion.get_name_and_price_checkout
    expect(@product_name).to eq(completion_name)
    expect(@product_price).to eq(completion_price)
end
  
Quando('o usuário estiver na página de finalização') do
    @completion_page = Pages::Completion.new
    @completion_page.load
end
  
E('o usuário clicar em cancelar na finalização') do
    @completion_page.cancel_completion
end
  
Quando('conferir o resumo na finalização e finalizar a compra') do
    @completion_page = Pages::Completion.new
    @completion_page.load
    completion_name, completion_price = @completion_page.checkout_completion.get_name_and_price_checkout
    expect(@product_name).to eq(completion_name)
    expect(@product_price).to eq(completion_price)
    @completion_page.finish_completion
end
  
Então('deverá ser realizada a compra com sucesso') do
    expect(page).to have_content('Thank you for your order!')
end