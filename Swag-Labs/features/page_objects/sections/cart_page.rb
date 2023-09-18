module Sections
    class Cart_page < SitePrism::Section
        elements :cart_items, '.cart_item'
        
        
        def get_name_and_price_cart
            cart = cart_items.first #.find('.inventory_item')
            cart_name = cart.find('.inventory_item_name').text
            cart_price = cart.find('.inventory_item_price').text
            return cart_name, cart_price
          end
        
    end
end