class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.string :account_type
      t.integer :customer_id

      t.timestamps
    end
  end
end
