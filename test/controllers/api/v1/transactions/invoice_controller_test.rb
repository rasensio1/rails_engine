require 'test_helper'

class Api::V1::Transactions::InvoiceControllerTest < ActionController::TestCase
  test "#index" do
    trans = create_invoice
    get :show, id: trans.id

    assert_equal 1, json["customer_id"]
  end

  def create_invoice
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
  end
end
