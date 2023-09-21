module Sections
    class Cart_page < SitePrism::Section
        elements :cart_items,        '.cart_list .cart_item'
        element  :remove_button,     '.cart_item .btn_secondary'
        element  :continue_shopping, '#continue-shopping'
        element  :go_to_checkout,    '#checkout'
        
        def get_name_and_price_cart
            cart = cart_items.first
            cart_name = cart.find('.inventory_item_name').text
            cart_price = cart.find('.inventory_item_price').text
            return cart_name, cart_price
        end

        def check_cart_empty
            cart_items = all('.cart_list .cart_item')
            return cart_items.empty?
        end

        def remove_product_cart
            remove_button.click
        end

        def continue_shopping_cart
            continue_shopping.click
        end

        def go_to_checkout_cart
            go_to_checkout.click
        end

        def count_cart
            page.all('.cart_item').count
        end
    end
end