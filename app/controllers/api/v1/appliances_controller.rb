# frozen_string_literal: true

class Api::V1::AppliancesController < ApplicationController
	before_action :authenticate_request
	before_action :set_appliance, except: [:refused_appliances, :accepted_appliances, :appliances]

	def appliances
    appliances = current_shelter.check_appliances(:analyzing).page page_param

    render_model(appliances, :ok)
  end

	def refused_appliances
		@appliances = current_shelter.check_appliances(:rejected)

		render_model(@appliances, :ok)
	end

	def accepted_appliances
		@appliances = current_shelter.check_appliances(:accepted)

		render_model(@appliances, :ok)
	end

	def accept_appliance
		adoption = Adoption.new(adopter_id: @appliance.adopter_id, appliance_id: @appliance.id)
		animal = @appliance.animal

		if adoption.save!
			animal.changes_to_adopted(@appliance.id)

			@appliance.update_attributes(status: :accepted)
		end
	end

	def refuse_appliance
		@appliance.update_attributes(status: :rejected)
	end

  def show_appliance
    @appliance ? render_model(@appliance, :ok) : 
                 render_model_not_found(@appliance)
  end

	private

	def set_appliance
		@appliance = current_shelter.appliances.find(params[:id])
	end

  def page_param
    params.require(:page) if params[:page]
  end
end