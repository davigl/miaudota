class CreateAdoptions < ActiveRecord::Migration[5.2]
  def change
    create_table :adoptions do |t|
      t.references :adopter, foreign_key: true
      t.references :appliance, foreign_key: true

      t.timestamps
    end
  end
end
