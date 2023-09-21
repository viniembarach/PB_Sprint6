module Sections
    class Header < SitePrism::Section
        element :menu_button, '#react-burger-menu-btn'
        element :cart_button, '.shopping_cart_link'
        element :logo, '.app_logo'
        element :back_to_home_pdp, '#back-to-products'
        element :navigate_all_items, '#inventory_sidebar_link'
        element :navigate_about, '#about_sidebar_link'
        element :navigate_logout, '#logout_sidebar_link'
        element :reset, '#reset_sidebar_link'

        def open_menu
            menu_button.click
        end

        def back_to_home
            navigate_all_items.click
        end

        def about
            navigate_about.click
        end

        def logout
            navigate_logout.click
        end

        def reset_app
            reset.click
        end
    end
end