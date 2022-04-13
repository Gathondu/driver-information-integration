class CreateInformation < ActiveRecord::Migration[6.1]
  def change
    create_table :information do |t|
      t.string :api_id
      t.string :first_name
      t.string :last_name
      t.string :license_number
      t.string :incidents
      t.string :vehicles

      t.timestamps
    end
  end
end
