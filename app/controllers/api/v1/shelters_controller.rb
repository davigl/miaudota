module Api
  module V1
    class SheltersController < ApplicationController
      before_action :authenticate_request
      
      def animals
        @animals = current_shelter.animals.order(:name).page params[:page]
      
        render_model(@animals, :ok)
      end

      def animals_infos
        all_animals = current_shelter.registered_animals
        adopted_animals = Animal.adopted_animals(true)
        non_adopted_animals = Animal.adopted_animals(false)

        render json: { animals_size: animals_size }
      end
    end
  end
end
