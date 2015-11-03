class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  validates :quantity, :unit_price, :item_id, :invoice_id, presence: true
end
