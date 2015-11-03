class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :name, :description, :unit_price, :merchant_id, presence: true

  def price 
    unit_price/100.00
  end

end

