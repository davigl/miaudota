class AddShelterToAppliances < ActiveRecord::Migration[5.2]
  def change
    add_reference :appliances, :shelter, foreign_key: true
  end
end
