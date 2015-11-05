class Transaction < ActiveRecord::Base
  belongs_to :invoice
  validates :invoice_id, presence: true

  scope :successful, -> { where(result: "success") }

  def self.for_a_customer(id)
    joins(:invoice).where("invoices.customer_id" => id )
  end
end
