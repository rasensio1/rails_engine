class Invoice < ActiveRecord::Base
  validates :customer_id, :merchant_id, presence: true

  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  scope :successful, -> { joins(:transactions).where("transactions.result" => "success") }
  scope :unsuccessful, -> { joins(:transactions).where("transactions.result" => "failed") }

  def self.for_transaction(id)
    joins(:transactions).where("transactions.id" => id).first
  end

  def self.for_invoice_item(id)
    joins(:invoice_items).where("invoice_items.id" => id ).first
  end

  def revenue
    invoice_items.reduce(0) do |agg, i_item|
      agg += i_item.unit_price * i_item.quantity
    end
  end
end
