# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :animals, only: %i[create show]

      # Users controller 

      post '/create-shelter', to: "users#create_shelter"
      post '/create-adopter', to: "users#create_adopter"

      # Animals controller

      post '/animals/attach-image', to: 'animals#attach_image'

      # Shelters controller

      post '/shelters', to: "shelters#shelters"
      get '/animals', to: 'shelters#animals'
      get '/animals-info', to: 'shelters#animals_info'
      delete '/delete-animal/:id', to: 'shelters#delete_animal'

      # Adopters controller

      get '/adopter-profile', to: "adopters#profile"
    end
  end

  post 'authenticate-adopter', to: 'authentication#authenticate_adopter'
  post 'authenticate-shelter', to: 'authentication#authenticate_shelter'
end
