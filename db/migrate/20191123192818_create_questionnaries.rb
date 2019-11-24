class CreateQuestionnaries < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaries do |t|
      t.json :home
      t.json :family
      t.json :pets
      t.references :adopter, foreign_key: true

      t.timestamps
    end
  end
end
