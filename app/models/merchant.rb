class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  validates :name, presence: true

  def self.revenue(id)
    InvoiceItem.joins(:invoice)
                .joins(:transactions)
                .where("transactions.result" => "success")
                .joins(:merchants).where("merchants.id" => id)
                .sum("quantity * unit_price")
  end
end
