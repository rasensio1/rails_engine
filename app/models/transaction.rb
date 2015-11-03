class Transaction < ActiveRecord::Base
  belongs_to :invoice

  validates :invoice_id, presence: true
end
