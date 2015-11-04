class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :name, :description, :unit_price, :merchant_id, presence: true

  def self.most_revenue
    #filter for successful transactions
     select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue").
     joins(:invoice_items).
     group("items.id").
     order("revenue DESC").limit(1)
  end
end

