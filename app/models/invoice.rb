class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant

  has_many :transactions
  has_many :invoice_items

  validates :customer_id, :merchant_id, presence: true
end
