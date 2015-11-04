class InvoiceItem < ActiveRecord::Base

  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice
  has_many :merchants, through: :invoice

  validates :quantity, :unit_price, :item_id, :invoice_id, presence: true

  scope :successful, -> { joins(:transactions).where("transactions.result" => "success") }
end
