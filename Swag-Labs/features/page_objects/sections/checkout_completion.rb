module Sections
    class Checkout_completion < SitePrism::Section
        elements :checkout_items,  '.cart_list .cart_item'
        element  :finish_button,   '#finish'
        element  :cancel_button,   '#cancel'
        
        def get_name_and_price_checkout
            checkout = checkout_items.first
            completion_name = checkout.find('.inventory_item_name').text
            completion_price = checkout.find('.inventory_item_price').text
            return completion_name, completion_price
        end
    end
end