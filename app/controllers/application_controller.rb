# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  def render_model(model, status)
    render json: model, status: status
  end

  def render_model_not_found(message)
    render json: { data: [], message: message }, status: :not_found
  end

  def render_model_unprocessable_entity(model)
    render json: { errors: model.errors }, status: :unprocessable_entity
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result

    render_authenticate_error unless @current_user
  end

  def render_authenticate_error
    render json: { error: 'Not authorized' }, status: 401
  end
end
