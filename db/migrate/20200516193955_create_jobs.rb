class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :summary
      t.string :qualification
      t.string :salary
      t.date :date_limit
      t.string :location
      t.references :level_job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
