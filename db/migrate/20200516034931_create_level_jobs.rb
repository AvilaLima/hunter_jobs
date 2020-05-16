class CreateLevelJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :level_jobs do |t|
      t.string :level

      t.timestamps
    end
  end
end
