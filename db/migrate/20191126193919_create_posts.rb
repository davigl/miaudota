class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :description
      t.string :thumbnail
      t.references :adopter, foreign_key: true

      t.timestamps
    end
  end
end
