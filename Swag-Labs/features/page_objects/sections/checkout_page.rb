module Sections
    class Checkout_page < SitePrism::Section
        element :input_first_name, '#first-name'
        element :input_last_name,  '#last-name'
        element :input_zip_code,   '#postal-code'
        element :continue_button,  '#continue'
        element :cancel_button,    '#cancel'
        
        def clear_fields
            input_first_name.set('')
            input_last_name.set('')
            input_zip_code.set('')
        end

        def blank_inputs
            input_first_name.set(' ')
            input_last_name.set(' ')
            input_zip_code.set(' ')
            continue_button.click
        end
    end
end