class Item < ActiveRecord::Base
  default_scope { order('id') }

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :name, :description, :unit_price, :merchant_id, presence: true

  def self.most_revenue(quantity)
    select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue").
    joins(:invoice_items).
    group("items.id").
    order("revenue DESC").limit(quantity)
  end

  def self.most_items(quantity)
    select("items.*, count(invoice_items.id) AS sold_count").
    joins(:invoice_items).uniq.merge(InvoiceItem.successful).
    group("items.id").
    order("sold_count DESC").limit(quantity)
  end

 # def self.best_day(id, date)
 #   where(id: id)
 #   .select("invoice_items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
 #   .joins(:invoice_items)
 #   .group("invoice_items.id")
 #   .order("revenue DESC").limit(1)
 # end

  def self.best_day(id)
        InvoiceItem.successful.where(item_id: id)
        .group("invoices.created_at")
        .order("sum_quantity DESC")
        .sum("quantity").first[0]
  end
end

