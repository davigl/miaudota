class CreateAppliances < ActiveRecord::Migration[5.2]
  def change
    create_table :appliances do |t|
      t.references :animal, foreign_key: true
      t.references :adopter, foreign_key: true
      t.string :schedule
      t.integer :status

      t.timestamps
    end
  end
end
