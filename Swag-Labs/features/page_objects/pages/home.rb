require_relative '../sections/login_page'
require_relative '../sections/header'
require_relative '../sections/products'
require_relative '../sections/pdp_page'

module Pages
    class Home < SitePrism::Page
        set_url '/inventory.html'

        section :login_page, Sections::Login_page, '#login_button_container'
        section :header, Sections::Header, '#header_container'
        section :product_items, Sections::Products, '#inventory_container .inventory_container'
        section :product_pdp, Sections::Pdp_page, '#inventory_item_container'

        def add_product_get_name_and_price
            product_items.add_to_cart_button.click
            product_items.get_name_and_price
        end

        def remove_product
            product_items.remove_button.click
        end
        
        def go_add_product_get_name_and_price_pdp
            product_items.go_to_pdp.click
            product_pdp.add_to_cart_button_pdp.click
            product_pdp.get_name_and_price_pdp
        end

        def remove_product_pdp
            product_items.go_to_pdp.click
            product_pdp.remove_button_pdp.click
        end

        def add_and_cart_icon_check
            product_items.add_products_to_cart(3)
        end
    end
end