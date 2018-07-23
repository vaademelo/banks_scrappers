class Bill < ActiveRecord::Base
  has_one  :account
  has_many :charges
end
