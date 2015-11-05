require 'test_helper'

class Api::V1::Customers::BusinessControllerTest < ActionController::TestCase
  test "#favorite_merchant" do
    cust = create_things
    get :favorite_merchant, id: cust.id

    assert_response :success
    assert_equal "Yo", json["name"]
  end

  def create_things
    m1 = Merchant.create(name: "Yeah")
    m2 = Merchant.create(name: "Yo")
    c1 = Customer.create(first_name: "Hi", last_name: "YOYO")
    inv1 = Invoice.create(customer_id: c1.id, merchant_id: m1.id)
    inv2 = Invoice.create(customer_id: c1.id, merchant_id: m2.id)
    inv3 = Invoice.create(customer_id: c1.id, merchant_id: m2.id)

    Transaction.create(invoice_id: inv1.id, result: "success")
    Transaction.create(invoice_id: inv2.id, result: "success")
    Transaction.create(invoice_id: inv3.id, result: "success")
    c1
  end
end
