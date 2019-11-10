# frozen_string_literal: true

module Api
  module V1
    class AnimalsController < ApplicationController
      before_action :authenticate_request, except: [:attach_image]

      def attach_image
        image = Cloudinary::Uploader.upload(params[:image])
        secure_url = image['secure_url']

        render_custom_element(:secure_url, secure_url)
      end

      def create
        @animal = Animal.new(animal_params)
        @animal.shelter = current_shelter

        if @animal.valid?
          @animal.save!

          render_model(@animal, :created)
        else
          render_model_unprocessable_entity(@animal)
        end
      end

      private

      def image_params
        params.permit(:image, :format)
      end

      def animal_params
        params.require(:animal).permit(:name, :description, :age,
                                       :specie, :size, :avatar, :gender, 
                                       :castrated, :weight)
      end
    end
  end
end
