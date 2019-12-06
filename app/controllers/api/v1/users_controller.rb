# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
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
    user = User.new(JSON.parse(user_params))
    adopter = Adopter.new(JSON.parse(adopter_params))
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
    params.require(:user).as_json
  end

  def adopter_params
    params.require(:adopter).as_json
  end

  def shelter_params
    params.require(:shelter).permit(:name, :state, :city, :street, :neighborhood,
                                    :number, :complement, :reference, :user_type)
  end
end
