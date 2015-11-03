require 'test_helper'

class Api::V1::Invoices::CustomerControllerTest < ActionController::TestCase
  test "#index" do
    inv = create_customers

    get :show, id: inv.id

    assert_equal "Hi", json["first_name"]
  end

  def create_customers
    m =  Merchant.create(name: "Yeah")
    c = Customer.create(first_name: "Hi", last_name: "YOYO")
    c2 = Customer.create(first_name: "yo", last_name: "yo")
    inv = Invoice.create(customer_id: c.id, merchant_id: m.id)
    inv2 = Invoice.create(customer_id: c2.id, merchant_id: m.id)
    Invoice.create(customer_id: c.id, merchant_id: m.id)
    inv
  end
end
