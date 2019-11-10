# frozen_string_literal: true

require 'faker'

# Creating a User Admin

username = Faker::Name.name

user = User.create(name: username, email: ENV['ADMIN_EMAIL'],
                   password: ENV['ADMIN_PASSWORD'],
                   password_confirmation: ENV['ADMIN_PASSWORD'])

# Creating Shelter

shelter_name = Faker::Company.name
shelter_state = Faker::Address.state
shelter_city = Faker::Address.city
shelter_street = Faker::Address.street_name
shelter_neighborhood = Faker::Address.community
shelter_number = Faker::Address.building_number
shelter_complement = Faker::Address.secondary_address

shelter = Shelter.create!(name: shelter_name, state: shelter_state,
                         city: shelter_city, street: shelter_street,
                         neighborhood: shelter_neighborhood,
                         number: shelter_number, complement: shelter_complement,
                         user: user, user_type: "User")

# Creating Animals

animal_name = Faker::Creature::Dog.name
animal_specie = 'Cachorro'
animal_age = Faker::Creature::Dog.age
animal_size = Faker::Creature::Dog.size
animal_castrated = false
animal_weight= 15
animal_gender = "Male"
animal_avatar = 'https://res.cloudinary.com/hasashisama/image/upload/v1569963001/knjyvxdgsqkolaqowk5f.jpg'

10.times do
  Animal.create(name: animal_name, specie: animal_specie,
                castrated: animal_castrated, gender: animal_gender, weight: animal_weight, 
                age: animal_age, size: animal_size, avatar: animal_avatar, 
                shelter_id: shelter.id)
end
