class AddEmailToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :email, :string
  end
end
