class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  validates :name, presence: true

  def unit_price
    unit_price / 100.00
  end

  def self.most_revenue(num)
     select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue").
     joins(:invoice_items).
     joins(:transactions).where("transactions.result" => "success").
     group("merchants.id").
     order("revenue DESC").limit(num)
  end

  def self.revenue(id, date = nil)
    if date
    InvoiceItem.joins(:invoice)
                .where("invoices.created_at" => date)
                .joins(:transactions)
                .where("transactions.result" => "success")
                .joins(:merchants).where("merchants.id" => id)
                .sum("quantity * unit_price") / 100.00
    else
    InvoiceItem.joins(:invoice)
                .joins(:transactions)
                .where("transactions.result" => "success")
                .joins(:merchants).where("merchants.id" => id)
                .sum("quantity * unit_price") / 100.00
    end
  end

  def self.revenue_date(date)
    InvoiceItem.joins(:invoice)
                .where("invoices.created_at" => date)
                .joins(:transactions)
                .where("transactions.result" => "success")
                .sum("quantity * unit_price") / 100.00
  end

  def self.customers_with_pending_invoices(id)
    res = Customer.joins(:invoices).joins(:transactions)
            .where("transactions.result" => "failed")
            .joins(:merchants)
            .where("merchants.id" => id)
            .uniq
     
  end

end
