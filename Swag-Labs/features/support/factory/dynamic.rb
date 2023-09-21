require 'faker'

module Factory
    class Dynamic
        def self.checkout_your_information
            {
                first_name: Faker::Name.first_name,
                last_name:  Faker::Name.last_name,
                zip_code:   Faker::Address.zip_code
            }
        end
    end
end