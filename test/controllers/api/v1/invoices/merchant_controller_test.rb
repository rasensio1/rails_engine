require 'test_helper'

class Api::V1::Invoices::MerchantControllerTest < ActionController::TestCase
  test "#index" do
    inv = create_merchants

    get :show, id: inv.id

    assert_equal "Yeah", json["name"]
  end

  def create_merchants
    m =  Merchant.create(name: "Yeah")
    m2 =  Merchant.create(name: "OK")
    c = Customer.create(first_name: "Hi", last_name: "YOYO")
    c2 = Customer.create(first_name: "yo", last_name: "yo")
    inv = Invoice.create(customer_id: c.id, merchant_id: m.id)
    inv2 = Invoice.create(customer_id: c2.id, merchant_id: m2.id)
    inv
  end
end
