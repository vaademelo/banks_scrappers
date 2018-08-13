class Bill < ActiveRecord::Base
  has_many :charges

  monetize :amount_subcents, as: "amount"
end
