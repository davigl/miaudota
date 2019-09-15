# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request
      before_action :set_user, only: [:show]

      def create
        user = User.new(user_params)

        user.valid? ? (user.save; render_model(user, :created)) : 
                      (render_model_unprocessable_entity(user))
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
    end
  end
end
