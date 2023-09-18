module Sections
    class Pdp_page < SitePrism::Section
        elements :pdp_item, '.inventory_details_container'
        element :add_to_cart_button, '.btn_inventory'
        element :product_name_element, '.inventory_details_name'
        element :product_price_element, '.inventory_details_price'
        element :remove_to_cart_button, '.btn_secondary'

        def add_to_cart_button_pdp
            add_to_cart_button
        end

        def get_name_and_price_pdp
            product_name = product_name_element.text
            product_price = product_price_element.text
            return product_name, product_price
        end

        def remove_button_pdp
            remove_to_cart_button
        end

    end
end