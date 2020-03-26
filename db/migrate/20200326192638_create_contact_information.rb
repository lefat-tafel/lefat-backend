class CreateContactInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_information do |t|
      t.string :name, limit: 1024
      t.string :phone, limit: 64
      t.string :fax, limit: 64
      t.string :mobile, limit: 64
      t.string :email, limit: 1024

      t.timestamps
    end
  end
end
