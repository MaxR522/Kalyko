class CreateNutriTables < ActiveRecord::Migration[6.0]
  def change
    create_table :nutri_tables do |t|
      t.string :calories
      t.string :proteines
      t.string :lipides
      t.string :glucides
      t.string :sucre
      t.string :acide_gras_satures
      t.string :fibres
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
