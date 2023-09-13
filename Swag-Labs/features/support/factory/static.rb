module Factory
    class Static
        def self.load_file #metodo para carregar arquivo
            YAML.load_file(File.dirname(__FILE__) + "/static/#{ENVIRONMENT}.yml")
        end

         def self.static_data(data) #metodo para trazer a massa de dados que queremos pegar que vem do static
            Static.load_file[data] #passando o data como chave q a gente vai acessar
         end
    end
    
end