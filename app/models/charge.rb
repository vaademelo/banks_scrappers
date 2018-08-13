class Charge < ActiveRecord::Base
  belongs_to :bill

  monetize :amount_subcents, as: "amount"
end
