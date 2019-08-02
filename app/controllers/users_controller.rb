# frozen_string_literal: true

module Api
  module V1
    class UsersController < ActionController::API
      before_action :set_user, only: [:show]
  
      def create
        @user = User.new(user_params)
        if @user.save
          render json: { data: @user.as_json(only: %w[name email]), status: 201 }
        else
          render json: { data: nil, status: 422, messages: @user.errors.full_messages }
        end
      end
  
      def teste; end
  
      def show
        if @user
          render json: { data: @user.as_json(only: %i[name email]), status: 200 }
        else
          render json: { data: [], status: 204, message: 'Usuário não encontrado.' }
        end
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
