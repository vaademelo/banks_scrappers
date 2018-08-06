class Bill < ActiveRecord::Base
  has_many :charges
end
