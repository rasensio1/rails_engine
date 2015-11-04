class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  validates :first_name, :last_name, presence: true

  def self.favorite_customer(cust_id)
    select("customers.*, count(transactions.id) AS transactions_count")
    .joins(:transactions) .where("transactions.result" => "success")
    .joins(:merchants) .where("merchants.id" => cust_id)
    .group("customers.id")
    .order("transactions_count DESC").limit(1)
  end
end
