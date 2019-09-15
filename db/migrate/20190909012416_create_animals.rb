class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :breed
      t.string :name
      t.text :description
      t.string :age
      t.boolean :adopted, default: false
      t.string :specie
      t.string :size
      t.references :shelter, foreign_key: true

      t.timestamps
    end
  end
end
