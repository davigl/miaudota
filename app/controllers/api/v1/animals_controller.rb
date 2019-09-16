# frozen_string_literal: true

module Api
  module V1
    class AnimalsController < ApplicationController
      skip_before_action :authenticate_request

      before_action :new, only: %i[attach_image]

      def new
        @animal = Animal.new
      end

      def attach_image; end

      def create
        @animal = Animal.new(animal_params)
        @animal.shelter = Shelter.last

        if @animal.valid? 
          @animal.save! 

          render_model(@animal, :created)
        else
          render_model_unprocessable_entity(@animal)
        end
      end

      private

      def animal_params
        params.require(:animal).permit(:breed, :name, :description, :age, :specie, :size, :avatar)
      end
    end
  end
end
