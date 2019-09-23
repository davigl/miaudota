# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: JSON } do
    namespace :v1 do
      resources :users, only: %i[create show]
      resources :animals, only: %i[create show]

      post 'animals/attach-image', to: 'animals#attach_image'
      get 'animals', to: 'shelters#animals'
    end
  end

  post 'authenticate', to: 'authentication#authenticate'
end
