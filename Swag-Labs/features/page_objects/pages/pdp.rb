require_relative '../sections/pdp_page'

module Pages
    class Pdp < SitePrism::Page
        set_url '/inventory-item.html'

        section :product_pdp, Sections::Pdp_page, '#inventory_item_container'
        
        def add_product_get_name_and_price_pdp
            product_pdp.add_to_cart_button_pdp.click
            product_pdp.get_name_and_price_pdp
        end
    end
end