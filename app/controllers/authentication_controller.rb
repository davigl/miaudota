# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    command.success? ? render_command(command, :created) : 
                       render_command_unauthorized(command)
  end

  private

  def render_command(command, status)
    render json: { auth_token: command.result }, status: status
  end

  def render_command_unauthorized(command)
    render json: { errors: command.errors }, status: :unauthorized
  end
end
