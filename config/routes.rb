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

      get '/applications', to: "adopters#appliances"
      get '/adopter-profile', to: "adopters#profile"
      get '/check-questionnaire', to: "adopters#check_questionnaire"
      post '/check-already-applied', to: "adopters#check_already_applied"
      post '/add-questionnaire', to: "adopters#add_questionnaire"
      post '/adopt-pet', to: "adopters#adopt_pet"
      post '/create-post', to: "adopters#create_post"

      # Posts controller

      get "/feed", to: "posts#index"

      # Appliances controller

      get '/refused-appliances', to: "appliances#refused_appliances"
      get '/accepted-appliances', to: "appliances#accepted_appliances"
      post '/accept-appliance/:id', to: "appliances#accept_appliance"
      put '/refuse-appliance/:id', to: "appliances#refuse_appliance"
      get '/appliance/:id', to: "appliances#show_appliance"
      get '/appliances', to: "appliances#appliances"
    end
  end

  # Authenticate

  post 'authenticate-adopter', to: 'authentication#authenticate_adopter'
  post 'authenticate-shelter', to: 'authentication#authenticate_shelter'
end
