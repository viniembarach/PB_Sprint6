#require_relative '../sections/cart_page'

module Pages
    class Cart < SitePrism::Page
        set_url '/cart.html'

        #section :cart_items, Sections::Cart_page, '.cart_list'
        elements :cart_items, '.cart_list .cart_item'
        
        
        def get_name_and_price_cart
            cart = cart_items.first #.find('.inventory_item')
            cart_name = cart.find('.inventory_item_name').text
            cart_price = cart.find('.inventory_item_price').text
            return cart_name, cart_price
        end

        def check_cart_empty
            cart_items = all('.cart_list .cart_item')
            return cart_items.empty?
        end
    end
end