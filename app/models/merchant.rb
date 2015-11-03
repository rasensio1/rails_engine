class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  validates :name, presence: true
end
