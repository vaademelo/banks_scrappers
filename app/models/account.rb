class Account < ActiveRecord::Base
  
  ACCOUNT_TYPES = ['bradesco_cartoes', 'nubank'] 
  
  has_many :bills
  has_many :charges, through: :bills

  validates :name, presence: true
  validates :login, presence: true
  validates :password, presence: true
  validates :account_type, presence: true
  validates :account_type, inclusion: { in: ACCOUNT_TYPES }

end