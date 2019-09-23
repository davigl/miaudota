# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show]

      def create
        user = User.new(user_params)
        shelter = Shelter.new(shelter_params)
        shelter.user = user

        if user.valid? and shelter.valid?
          user.save; shelter.save

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
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

      def shelter_params
        params.require(:shelter).permit(:name, :state, :city, :street, :neighborhood,
                                        :number, :complement, :reference)
      end
    end
  end
end
