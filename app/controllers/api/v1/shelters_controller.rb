module Api
  module V1
    class SheltersController < ApplicationController
      before_action :authenticate_request
      before_action :set_animals, only: [:destroy]

      def animals
        param_specie, param_size = params[:specie], params[:size]

        animals = current_shelter.animals.order(:name).page page_param
        animals = current_shelter.animals_filter_species(animals, param_specie) if param_specie
        animals = current_shelter.animals_filter_sizes(animals, param_size) if param_size

        render_model(animals, :ok)
      end

      def animals_info
        all_animals = current_shelter.registered_animals_size
        adopted_animals = current_shelter.adopted_animals(true)
        non_adopted_animals = current_shelter.adopted_animals(false)

        render json: { animals_size: all_animals,
                       adopted_animals: adopted_animals,
                       non_adopted_animals: non_adopted_animals }
      end

      def delete_animal
        animal = @animals.find(params[:id])

        animal.destroy if animal
      end

      private

      def set_animals
        @animals = current_shelter.animals
      end

      def page_param
        params.require(:page) if params[:page]
      end
    end
  end
end
