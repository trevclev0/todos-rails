# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

seed_username = ENV.fetch("SEED_USERNAME") { raise "SEED_USERNAME is not set!" }
seed_password = ENV.fetch("SEED_USER_PASSWORD") { raise "SEED_USER_PASSWORD is not set!" }

user = User.find_or_create_by!(username: seed_username)
user.update!(password: seed_password)

todos = [
  { title: "Milk",  description: "Buy milk from the store",  completed: true  },
  { title: "Eggs",  description: "Buy eggs from the store",  completed: false },
  { title: "Bread", description: "Buy bread from the store", completed: false }
]

todos.each do |attrs|
  user.todos.find_or_initialize_by(title: attrs[:title]).update!(attrs)
end
