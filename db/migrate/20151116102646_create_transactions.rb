class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.integer :amount
      t.integer :balance
      t.date :transaction_date
      t.references :citizen, index: true, foreign_key: true
      #t.references :bank, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
