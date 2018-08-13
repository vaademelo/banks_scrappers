class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.string   :date
      t.string   :description
      t.monetize :amount
      t.string   :category

      t.integer  :bill_id

      t.timestamps
    end
  end
end
