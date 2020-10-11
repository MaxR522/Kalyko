class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :time
      t.integer :person_number

      t.timestamps
    end
  end
end
