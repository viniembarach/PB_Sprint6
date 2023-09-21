require_relative '../sections/cart_page'
require_relative '../sections/header'

module Pages
    class Cart < SitePrism::Page
        set_url '/cart.html'

        section :header,     Sections::Header,    '#header_container'
        section :cart_items, Sections::Cart_page, '#cart_contents_container'
        
        def get_icon_cart_count
            header.icon_cart_num.text.to_i
        end
    end
end