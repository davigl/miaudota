# frozen_string_literal: true

module Api
  module V1
    class UsersController < ActionController::API
      before_action :set_user, only: [:show]

      def create
        user = User.create(user_params)
        if user.valid?
          render_user(user, :created)
        else
          render_user_unprocessable_entity(user)
        end
      end

      def teste; end

      def show
        if @user
          render_user(@user, :ok)
        else
          render_user_not_found(@user)
        end
      end

      private

      def render_user(user, status)
        render json: user, status: status
      end

      def render_user_not_found
        render json: { data: [], message: 'Usuário não encontrado.' }, status: :not_found
      end

      def render_user_unprocessable_entity(user)
        render json: { errors: user.errors }, status: :unprocessable_entity
      end

      def set_user
        @user = User.find_by_id(params[:id])
      end

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end
