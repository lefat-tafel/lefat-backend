class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :line_1, limit: 1024, null: false
      t.string :line_2, limit: 1024
      t.string :line_3, limit: 1024
      t.string :zip_code, limit: 256, null: false
      t.string :town, limit: 1024, null: false

      t.timestamps
    end
  end
end
