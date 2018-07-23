#Set up database tables and columns
ActiveRecord::Schema.define do
  create_table :bills, force: true do |t|
    t.string  :period
    t.integer :amount
    t.string  :account
  end
  create_table :charges, force: true do |t|
    t.string  :date
    t.string  :description
    t.integer :amount
    t.string  :category

    t.references :bill
  end
end
