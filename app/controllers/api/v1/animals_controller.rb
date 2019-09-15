# frozen_string_literal: true

module Api
	module V1
		class AnimalsController < ApplicationController
			skip_before_action :authenticate_request

			before_action :new, only: %i[attach_image create]

			def new
				@animal = Animal.new
			end

			def attach_image				
				@animal.image.attach(image_param)
			end

			def create
				@animal.attributes = animal_params
				@animal.image.attach(image_param)
				
				@animal.shelter = Shelter.last

				@animal.valid? ? (@animal.save; render_model(@animal, :created)) : 
												 (render_model_unprocessable_entity(@animal))
			end

			private

			def image_param
				params.permit(:image, :format)
			end

			def animal_params
				params.require(:animal).permit(:breed, :name, :description, :age, :specie, :size)
			end
		end
	end
end