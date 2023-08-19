class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :transaction_amount
      t.datetime :date
      t.integer :account_id

      t.timestamps
    end
  end
end
