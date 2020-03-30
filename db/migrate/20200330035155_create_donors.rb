class CreateDonors < ActiveRecord::Migration[6.0]
  def change
    create_table :donors do |t|
      t.string :name, limit: 1024
      t.string  :status,  limit: 200

      t.timestamps
    end
  end
end
