require_relative '../sections/checkout_completion'

module Pages
    class Completion < SitePrism::Page
        set_url '/checkout-step-two.html'

        section :checkout_completion, Sections::Checkout_completion, '#checkout_summary_container'

        def finish_completion
            checkout_completion.finish_button.click
        end

        def cancel_completion
            checkout_completion.cancel_button.click
        end
    end
end