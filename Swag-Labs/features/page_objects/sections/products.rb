module Sections
    class Products < SitePrism::Section
        elements :inventory_items, '.inventory_item'
        
        def add_to_cart_button
            inventory_items.first.find('.btn_inventory')
        end
        
        def get_name_and_price
            product = inventory_items.first
            product_name = product.find('.inventory_item_name').text
            product_price = product.find('.inventory_item_price').text
            return product_name, product_price
        end

        def remove_button
            inventory_items.first.find('.btn_secondary')
        end

        def go_to_pdp
            inventory_items.first.find('.inventory_item_name')
        end

        private def add_product_to_cart(index)
            inventory_items[index].find('.btn_inventory').click
          end
      
        def add_products_to_cart(quantity)
            (0...quantity).each do |i|
                add_product_to_cart(i)
            end
        end
    end
end