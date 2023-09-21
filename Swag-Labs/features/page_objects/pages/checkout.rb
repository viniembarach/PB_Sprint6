require_relative '../sections/checkout_page'

module Pages
    class Checkout < SitePrism::Page
        set_url '/checkout-step-one.html'

        section :check_items, Sections::Checkout_page, '.checkout_info_wrapper'
        
        def send_information(checkout_data)
            check_items.input_first_name.set checkout_data[:first_name]
            check_items.input_last_name.set  checkout_data[:last_name]
            check_items.input_zip_code.set   checkout_data[:zip_code]
            check_items.continue_button.click
        end
    end
end