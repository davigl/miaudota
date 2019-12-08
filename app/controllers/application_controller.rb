# frozen_string_literal: true

class ApplicationController < ActionController::API
  attr_reader :current_user, :current_shelter, :current_adopter

  def render_model(model, status)
    render json: model, status: status
  end

  def render_custom_model(model, custom_element, status)
    if model.any?
      render json: model, custom_element: custom_element, status: status
    else
      render json: { data: [] }, status: :not_found
    end
  end

  def render_model_not_found(message)
    render json: { data: [], message: message }, status: :not_found
  end

  def render_model_unprocessable_entity(model)
    render json: { errors: model.errors }, status: :unprocessable_entity
  end

  def render_custom_element(element_name, element_value)
    render json: { element_name => element_value }, status: :ok
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result

    render_authenticate_error unless @current_user
  end

  private

  def current_shelter
    @current_shelter = current_user.shelter
  end

  def current_adopter
    @current_adopter = current_user.adopter
  end

  def render_authenticate_error
    render json: { error: 'Not authorized' }, status: 401
  end
end
