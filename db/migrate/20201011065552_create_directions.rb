class CreateDirections < ActiveRecord::Migration[6.0]
  def change
    create_table :directions do |t|
      t.string :steps
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
