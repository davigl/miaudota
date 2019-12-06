# frozen_string_literal: true

class Api::V1::AdoptersController < ApplicationController
  before_action :authenticate_request

  def profile
    render_model(current_adopter, :ok)
  end

  def create_post
    post = Post.new(JSON.parse(post_params))
    post.update_attributes(thumbnail: current_adopter.upload_image(params[:file]),
                           adopter_id: current_adopter.id)

    if post.save
      render_model(post, :created)
    else
      render_model_unprocessable_entity(post)
    end
  end

  def appliances
    appliances = current_adopter.appliances.reverse

    render_custom_model(appliances, 'appliance', :ok)
  end

  def add_questionnaire
    questionnarie = Questionnarie.new(questionnarie_params)
    adopter = current_adopter
    adopter.questionnarie = questionnarie

    render_model(adopter, :created) if adopter.save
  end

  def adopt_pet
    animal = Animal.find(adopt_params[:animal_id])
    appliance = Appliance.new(animal: animal, adopter: current_adopter,
                              shelter: animal.shelter, status: adopt_params[:status])

    render_model(appliance, :created) if appliance.save!
  end

  def check_questionnaire
    has_questionnarie = current_adopter.questionnarie.present?

    render_custom_element(:hasQuestionnarie, has_questionnarie)
  end

  def check_already_applied
    had_applied = current_adopter.check_already_applied(adopt_params)

    render_custom_element(:checkApplied, had_applied)
  end

  private

  def post_params
    params.require(:post).as_json
  end

  def questionnarie_params
    params.require(:questionnaire).permit!
  end

  def adopt_params
    params.require(:adoption).permit(:animal_id, :status)
  end
end
