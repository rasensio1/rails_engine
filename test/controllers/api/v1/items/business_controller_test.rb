require 'test_helper'

class Api::V1::Items::BusinessControllerTest < ActionController::TestCase
  test "#index" do
    create_items
    get :most_revenue

    assert_response :success
    assert_equal "Yo", json.first["name"]
  end

  def create_items
    m1 = Merchant.create(name: "Yeah")
    m2 = Merchant.create(name: "Yo")
    c1 = Customer.create(first_name: "Hi", last_name: "YOYO")
    c2 = Customer.create(first_name: "yo", last_name: "yo")
    inv1 = Invoice.create(customer_id: c1.id, merchant_id: m1.id)
    inv2 = Invoice.create(customer_id: c2.id, merchant_id: m2.id)
    i1 = Item.create(name: "Yeah", description: "also good", unit_price: 1234, merchant_id: m1.id)
    i2 = Item.create(name: "YO", description: "best", unit_price: 1234, merchant_id: m2.id)
    i3 = Item.create(name: "Hi", description: "the best", unit_price: 1234, merchant_id: m1.id)
    InvoiceItem.create(quantity: 2, unit_price: 2, item_id: i1.id, invoice_id: inv1.id)
    InvoiceItem.create(quantity: 2, unit_price: 2, item_id: i1.id, invoice_id: inv2.id)
    InvoiceItem.create(quantity: 3, unit_price: 2, item_id: i2.id, invoice_id: inv1.id)
    Transaction.create(invoice_id: inv2.id, result: "failure")
    Transaction.create(invoice_id: inv1.id, result: "success")
  end
end
