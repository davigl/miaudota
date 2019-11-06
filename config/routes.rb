# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: JSON } do
    namespace :v1 do
      resources :users, only: %i[create show]
      resources :animals, only: %i[create show]

      post '/create-adopter', to: "users#create_adopter"
      post '/animals/attach-image', to: 'animals#attach_image'
      get '/animals', to: 'shelters#animals'
      get '/animals-info', to: 'shelters#animals_info'
      delete '/delete-animal/:id', to: 'shelters#delete_animal'
    end
  end

  post 'authenticate', to: 'authentication#authenticate'
end
