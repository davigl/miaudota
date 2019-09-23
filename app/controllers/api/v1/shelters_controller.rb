module Api
  module V1
    class SheltersController < ApplicationController
      before_action :authenticate_request

      def animals
        @animals = current_shelter.animals.order(:name).page params[:page]

        render_model(@animals, :ok)
      end

      def animals_info
        all_animals = current_shelter.registered_animals
        adopted_animals = Animal.adopted_animals(true)
        non_adopted_animals = Animal.adopted_animals(false)

        render json: { animals_size: all_animals,
                       adopted_animals: adopted_animals,
                       non_adopted_animals: non_adopted_animals }
      end
    end
  end
end
