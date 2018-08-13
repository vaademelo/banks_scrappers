class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string    :period
      t.monetize  :amount
      t.integer   :account_id
      
      t.timestamps
    end
  end
end
