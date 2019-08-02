require 'faker'

# User Admin

User.create(name: Faker::Name.name, email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'],
            password_confirmation: ENV['ADMIN_PASSWORD'])
