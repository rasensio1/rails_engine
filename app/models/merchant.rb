class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  validates :name, presence: true

  def self.favorite_merchant(cust_id)
    select("merchants.*, count(transactions.id) AS transactions_count")
    .joins(:transactions) .where("transactions.result" => "success")
    .joins(:customers) .where("customers.id" => cust_id)
    .group("merchants.id")
    .order("transactions_count DESC").limit(1)
  end

  def self.most_revenue(num)
     select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue").
     joins(:invoice_items).
     group("merchants.id").
     order("revenue DESC").limit(num).merge(InvoiceItem.successful)
  end

  def self.most_items(num)
     select("merchants.*, sum(invoice_items.quantity) AS totals").
     joins(:invoice_items).
     group("merchants.id").
     order("totals DESC").limit(num).merge(InvoiceItem.successful)
  end

  def self.items(id)
    joins(:items).where("items.id" => id).first
  end

  def self.inv_items_for_merchants
    InvoiceItem.successful.group(:merchant_id).sum("quantity")
  end

  def self.revenue(id, date = nil)
    if date
    InvoiceItem.successful.joins(:invoice)
                .where("invoices.created_at" => date)
                .joins(:merchants).where("merchants.id" => id)
                .sum("quantity * unit_price") / 100.00
    else
    InvoiceItem.successful.joins(:invoice)
                .joins(:merchants).where("merchants.id" => id)
                .sum("quantity * unit_price") / 100.00
    end
  end

  def self.revenue_date(date)
    InvoiceItem.successful.joins(:invoice)
                .where("invoices.created_at" => date)
                .sum("quantity * unit_price") / 100.00
  end

  def self.pending_invoices(id)
    Customer.joins(:invoices)
            .where("invoices.merchant_id" => id)
            .distinct.merge(Invoice.unsuccessful)
  end
end
