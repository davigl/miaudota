# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create_shelter
        user = User.new(user_params)
        shelter = Shelter.new(shelter_params)
        shelter.user = user

        if user.valid? && shelter.valid?
          user.save; shelter.save

          render_model(user, :created)
        else
          render_model_unprocessable_entity(user)
        end
      end

      def create_adopter
        user = User.new(user_params)
        adopter = Adopter.new(adopter_params)
        adopter.update_attributes(user: user, thumbnail: adopter.upload_image(params[:file]))

        if user.valid? && adopter.valid?
          user.save; adopter.save

          render_model(user, :created)
        else
          render_model_unprocessable_entity(user)
        end
      end

      private

      def user_params
        user = params.require(:user)

        user.is_a? (Hash) ? user : JSON.parse(user)
      end

      def adopter_params
        adopter = params.require(:adopter)
        
        adopter.is_a? (Hash) ? adopter : JSON.parse(user)
      end

      def shelter_params
        params.require(:shelter).permit(:name, :state, :city, :street, :neighborhood, 
                                        :number, :complement, :reference)
      end
    end
  end
end
