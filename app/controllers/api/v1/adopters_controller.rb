# frozen_string_literal: true

class Api::V1::AdoptersController < ApplicationController
	before_action :authenticate_request
	
	def profile
		render_model(current_adopter, :ok)
	end
end