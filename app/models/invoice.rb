class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant

  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  validates :customer_id, :merchant_id, presence: true

  def revenue
    invoice_items.reduce(0) do |agg, i_item|
      agg += i_item.unit_price * i_item.quantity
    end
  end
end
