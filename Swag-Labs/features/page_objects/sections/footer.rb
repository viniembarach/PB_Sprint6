module Sections
    class Footer < SitePrism::Section
        element :icon_twitter,   '.social_twitter'
        element :icon_facebook,  '.social_facebook'
        element :icon_linkedin,  '.social_linkedin'

        def go_twitter
            icon_twitter.click
        end

        def go_facebook
            icon_facebook.click
        end

        def go_linkedin
            icon_linkedin.click
        end
    end
end