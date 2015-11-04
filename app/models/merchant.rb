class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  validates :name, presence: true

  def self.successful_invoices(id)
    Invoice.joins(:merchant).where("merchants.id" => id)
           .joins(:transactions).where("transactions.result" => "success")
  end

  def self.revenue(id)
    successful_invoices(id).includes(:invoice_items).reduce(0) do |sum, inv|
      sum += inv.revenue
    end
  end


end
