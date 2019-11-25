# frozen_string_literal: true

class Api::V1::AdoptersController < ApplicationController
	before_action :authenticate_request
	
	def profile
		render_model(current_adopter, :ok)
	end

	def appliances
		appliances = current_adopter.appliances
		
		render_model(appliances, :ok)
	end

	def add_questionnaire
		questionnarie = Questionnarie.new(questionnarie_params)
		adopter = current_adopter
		adopter.questionnarie = questionnarie

		if (adopter.save)
			render_model(adopter, :created)
		end
	end

	def adopt_pet
		animal = Animal.find(adopt_params[:animal_id])
		appliance = Appliance.new(adopt_params)
		appliance.adopter = current_adopter
		appliance.shelter_id = animal.shelter.id

		if (appliance.save)
			render_model(appliance, :created)
		end
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

	def questionnarie_params
		params.require(:questionnaire).permit!
	end

	def adopt_params
		params.require(:adoption).permit(:animal_id)
	end
end