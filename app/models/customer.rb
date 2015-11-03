class Customer < ActiveRecord::Base
  has_many :invoices

  validates :first_name, :last_name, presence: true
end
