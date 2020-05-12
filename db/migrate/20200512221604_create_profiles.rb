class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :social_name
      t.date :birth_date
      t.string :formation
      t.string :summary
      t.string :experience
      t.integer :favorite

      t.timestamps
    end
  end
end
