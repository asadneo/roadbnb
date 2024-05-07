# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
User.destroy_all
user1 = User.create(first_name: 'John', last_name: 'Smith', type_of_user: 'owner', contact: '020753128888', email: 'user1@example.com', password: 'abcd')
user2 = User.create(first_name: 'Malcomn', last_name: 'Marshall', type_of_user: 'owner', contact: '444-222-751', email: 'user2@example.com', password: 'efgh')

Car.destroy_all
Car.create(make: 'Toyota', model: 'Camry', year: '2022', img_url: 'https://example.com/toyota_camry.jpg', user_id: user1.id)
Car.create(make: 'Honda', model: 'Civic', year: '2021', img_url: 'https://example.com/honda_civic.jpg', user_id: user2.id)
#   end
