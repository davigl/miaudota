# frozen_string_literal: true

class Api::V1::SheltersController < ApplicationController
  before_action :authenticate_request
  before_action :set_animals, only: [:delete_animal]

  def shelters
    latitude, longitude = params[:latitude], params[:longitude]

    shelters = Shelter.near([latitude, longitude], 5, units: :km)

    render_model(shelters, :ok)
  end

  def animals
    param_specie, param_size = params[:specie], params[:size]

    animals = current_shelter.animals.order(:name).page page_param
    animals = current_shelter.animals_filter_species(param_specie) if param_specie
    animals = current_shelter.animals_filter_sizes(param_size) if param_size

    render_model(animals, :ok)
  end

  def appliances
    appliances = current_shelter.appliances.page page_param

    render_model(appliances, :ok)
  end

  def animals_info
    all_animals = current_shelter.registered_animals_size
    adopted_animals = current_shelter.adopted_animals(true)
    non_adopted_animals = current_shelter.adopted_animals(false)

    render_animals_info(all_animals, adopted_animals, non_adopted_animals)
  end

  def delete_animal
    animal = @animals.find(params[:id])

    animal&.destroy
  end

  private

  def render_animals_info(all_animals, adopted_animals, non_adopted_animals)
    render json: { animals_size: all_animals,
     adopted_animals: adopted_animals,
     non_adopted_animals: non_adopted_animals
   }, status: :ok
 end

  def set_animals
    @animals = current_shelter.animals
  end

  def page_param
    params.require(:page) if params[:page]
  end
end