module Sections
    class Header < SitePrism::Section
        element :menu_button, '#react-burger-menu-btn'
        element :cart_button, '.shopping_cart_link'
        element :logo, '.app_logo'
        element :back_to_home_pdp, '#back-to-products'
        
    end
end