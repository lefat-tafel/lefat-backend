class CreateRecipients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipients do |t|
      t.integer :people_in_household, default: 1
      t.string  :status,  limit: 200

      t.timestamps
    end

  end
end
