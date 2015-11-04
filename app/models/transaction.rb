class Transaction < ActiveRecord::Base
  default_scope { where(:result=> "success") }
  belongs_to :invoice

  validates :invoice_id, presence: true
end
