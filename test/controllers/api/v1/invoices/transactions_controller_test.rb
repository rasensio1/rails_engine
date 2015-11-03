require 'test_helper'

class Api::V1::Invoices::TransactionsControllerTest < ActionController::TestCase

  test "#index" do
    inv = create_transactions
    merch = Merchant.find_by(name: "Yeah")

    get :index, id: inv.id

    assert_equal 2, json.count
  end

  def create_transactions
    Merchant.create(name: "Yeah")
    Merchant.create(name: "Yo")
    Customer.create(first_name: "Hi", last_name: "YOYO")
    Customer.create(first_name: "yo", last_name: "yo")
    i1 = Invoice.create(customer_id: 1, merchant_id: 2)
    i2 = Invoice.create(customer_id: 2, merchant_id: 3)
    Invoice.create(customer_id: 1, merchant_id: 1)
    Transaction.create(invoice_id: i1.id)
    Transaction.create(invoice_id: i2.id)
    Transaction.create(invoice_id: i1.id)
    i1
  end
end
