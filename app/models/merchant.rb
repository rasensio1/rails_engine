class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  validates :name, presence: true

  def unit_price
    unit_price / 100.00
  end

  def self.revenue(id, date)
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

  def self.most_revenue(limit)
    Merchant.joins(:transactions)
  end


end
