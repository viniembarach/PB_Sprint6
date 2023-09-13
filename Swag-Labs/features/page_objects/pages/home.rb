require_relative '../sections/login_page'

module Pages
    class Home < SitePrism::Page
        set_url '/'

        section :login_page, Sections::Login_page, '#login_button_container'

        # def search_for(product)
        #     header.click_and_input_text_for_search(product)
        #     wait_until_loader_visible # espera que fique visivel para mudar (wait: 2) se não ele pega o padrao do env
        #     wait_until_loader_invisible # e depois espera que fique invisivel
        #     header.btn_open_search.click
        #     header.clsoe_search.click #clicando no botão para fechar a busca
        # end
    end
end