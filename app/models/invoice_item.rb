class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice
  has_many :merchants, through: :invoice

  validates :quantity, :unit_price, :item_id, :invoice_id, presence: true

  def price
    unit_price/100.00
  end

  def as_json(options = {})
    super(options.merge except: [:unit_price], methods: [:price])
  end
end
