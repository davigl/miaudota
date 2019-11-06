# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show]

      def create
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

        p params[:adopter][:thumbnail]

        image = params[:adopter][:thumbnail][:uri]
        upload_image(image)

        adopter.user = user

        if user.valid? && adopter.valid?
          user.save; adopter.save

          render_model(user, :created)
        else
          render_model_unprocessable_entity(user)
        end
      end

      def show
        @user ? render_model(@user, :ok) : render_model_not_found(@user)
      end

      private

      def set_user
        @user = User.find_by_id(params[:id])
      end

      def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation)
      end

      def shelter_params
        params.require(:shelter).permit(:name, :state, :city, :street, :neighborhood, 
                                        :number, :complement, :reference)
      end

      def adopter_params
        params.require(:adopter).permit(:city, :state, :phone_number, :thumbnail)
      end

      def upload_image(image)
        image = Cloudinary::Uploader.upload(image)
        secure_url = image['secure_url']
      end
    end
  end
end
