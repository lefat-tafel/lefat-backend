class CreateContactInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_information do |t|
      t.string :name, limit: 1024
      t.string :phone, limit: 64
      t.string :fax, limit: 64
      t.string :mobile, limit: 64
      t.string :email, limit: 1024
      t.integer :contactable_id, null: false
      t.string :contactable_type, null: false, limit: 1024

      t.timestamps
    end

    add_index :contact_information, [:contactable_id, :contactable_type],
              name: 'index_contact_information_contactable_foreign_key'
  end
end
