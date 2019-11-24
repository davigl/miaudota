# frozen_string_literal: true

class AuthenticationController < ApplicationController
  def authenticate_shelter
    command = AuthenticateUser.call(params[:email], params[:password], "shelter")

    command.success? ? render_command(command, :created) : 
                       render_command_unauthorized(command)
  end

  def authenticate_adopter
    command = AuthenticateUser.call(params[:email], params[:password], "adopter")

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
