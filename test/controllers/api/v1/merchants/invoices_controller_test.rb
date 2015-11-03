require 'test_helper'

class Api::V1::Merchants::InvoicesControllerTest < ActionController::TestCase

  test "#index" do
    inv = create_invoices
    merch = inv.merchant

    get :index, id: merch.id

    assert_equal 2, json.count
  end

  def create_invoices
    m1 = Merchant.create(name: "Yeah")
    m2 = Merchant.create(name: "Yo")
    Customer.create(first_name: "Hi", last_name: "YOYO")
    Customer.create(first_name: "yo", last_name: "yo")
    Invoice.create(customer_id: 1, merchant_id: m1.id)
    Invoice.create(customer_id: 2, merchant_id: m2.id)
    Invoice.create(customer_id: 1, merchant_id: m1.id)
  end
end
