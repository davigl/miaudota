# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: JSON } do
    namespace :v1 do
      resources :users, only: %i[create show]
    end
  end

  post 'authenticate', to: 'authentication#authenticate'
end
