class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :name, :description, :unit_price, :merchant_id, presence: true

  def self.most_revenue(quantity)
    select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue").
    joins(:invoice_items).uniq.merge(InvoiceItem.successful).
    group("items.id").
    order("revenue DESC").limit(quantity)
  end

  def self.most_items(quantity)
    select("items.*, count(invoice_items.id) AS sold_count").
    joins(:invoice_items).uniq.merge(InvoiceItem.successful).
    group("items.id").
    order("sold_count DESC").limit(quantity)
  end
end

