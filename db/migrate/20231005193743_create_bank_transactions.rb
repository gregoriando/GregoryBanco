class CreateBankTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_transactions do |t|
      t.integer :transaction_type
      t.decimal :transaction_value
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
