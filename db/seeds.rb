# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Limpar dados existentes
puts "Limpando dados existentes..."
Autorium.destroy_all
Titulo.destroy_all
Autor.destroy_all

# Criar Autores
puts "Criando autores..."
autor1 = Autor.create!(
  name: "Thiago Mares",
  email: "thiago@exemplo.com",
  local: "Belo Horizonte"
)

autor2 = Autor.create!(
  name: "Ana Silva",
  email: "ana@exemplo.com",
  local: "São Paulo"
)

autor3 = Autor.create!(
  name: "Carlos Santos",
  email: "carlos@exemplo.com",
  local: "Rio de Janeiro"
)

# Criar Títulos
puts "Criando títulos..."
titulo1 = Titulo.create!(
  titulo: "Introdução ao Ruby on Rails",
  corpo: "Ruby on Rails é um framework web muito poderoso e elegante. Permite criar aplicações web de forma rápida e com código limpo."
)

titulo2 = Titulo.create!(
  titulo: "Aprendendo Active Record",
  corpo: "Active Record é a camada ORM do Rails que facilita muito o trabalho com banco de dados. Com ele você pode manipular dados sem escrever SQL."
)

titulo3 = Titulo.create!(
  titulo: "Deploy de aplicações Rails",
  corpo: "Fazer deploy de aplicações Rails pode ser feito de diversas formas. As opções mais populares incluem Heroku, AWS e Digital Ocean."
)

titulo4 = Titulo.create!(
  titulo: "Testes com RSpec",
  corpo: "RSpec é uma ferramenta essencial para testes em Ruby. Permite escrever testes legíveis e manter a qualidade do código."
)

titulo5 = Titulo.create!(
  titulo: "APIs RESTful com Rails",
  corpo: "Rails facilita muito a criação de APIs RESTful. Com poucos comandos você já tem endpoints funcionando perfeitamente."
)

# Criar Autorias (relacionamentos entre Títulos e Autores)
puts "Criando autorias..."
Autorium.create!(titulo: titulo1, autor: autor1)
Autorium.create!(titulo: titulo2, autor: autor1)
Autorium.create!(titulo: titulo3, autor: autor2)
Autorium.create!(titulo: titulo4, autor: autor3)
Autorium.create!(titulo: titulo5, autor: autor2)

puts "✅ Seeds criados com sucesso!"
puts "   #{Autor.count} autores"
puts "   #{Titulo.count} títulos"
puts "   #{Autorium.count} autorias"
