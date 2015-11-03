require 'test_helper'

class Api::V1::Customers::TransactionsControllerTest < ActionController::TestCase
  test "#index" do
    cust = create_invoices
    get :index, id: cust.id

    assert_equal 2, json.count
  end

  def create_invoices
    m =  Merchant.create(name: "Yeah")
    m2 =  Merchant.create(name: "OK")
    c = Customer.create(first_name: "Hi", last_name: "YOYO")
    c2 = Customer.create(first_name: "yo", last_name: "yo")
    inv = Invoice.create(customer_id: c.id, merchant_id: m.id)
    inv2 = Invoice.create(customer_id: c2.id, merchant_id: m2.id)
    inv3 = Invoice.create(customer_id: c.id, merchant_id: m2.id)
    Transaction.create(invoice_id: inv.id)
    Transaction.create(invoice_id: inv.id)
    Transaction.create(invoice_id: inv2.id)
    c
  end
end
