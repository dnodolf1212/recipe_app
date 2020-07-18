class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.string :ingredients
      t.string :instructions
      t.integer :user_id
    end
  end
end
