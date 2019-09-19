require 'faker'

# User Admin

User.create(name: Faker::Name.name, email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'],
            password_confirmation: ENV['ADMIN_PASSWORD'])

# Creating Animals

10.times { Animal.create(name: Faker::Creature::Dog.name, specie: "Cachorro", 
			     breed: Faker::Creature::Dog.breed, age: Faker::Creature::Dog.age,
			     size: Faker::Creature::Dog.size, avatar: "https://res.cloudinary.com/hasashisama/image/upload/v1568921645/a66dtxcnpgitzmddgvuq.png",
			     shelter_id: Shelter.last.id )
			   }
