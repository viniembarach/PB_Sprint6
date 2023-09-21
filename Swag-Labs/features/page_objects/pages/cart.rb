#require_relative '../sections/cart_page'
require_relative '../sections/header'

module Pages
    class Cart < SitePrism::Page
        set_url '/cart.html'

        section :header, Sections::Header, '#header_container'
        #section :cart_items, Sections::Cart_page, '.cart_list'
        elements :cart_items, '.cart_list .cart_item'
        element :remove_button, '.cart_item .btn_secondary'
        element :continue_shopping, '#continue-shopping'
        element :go_to_checkout, '#checkout'
        element :icon_cart_num, '.shopping_cart_badge'
        
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

        def get_icon_cart_count
            icon_cart_num.text.to_i
        end
    end
end