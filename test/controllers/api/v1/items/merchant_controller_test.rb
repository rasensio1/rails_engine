require 'test_helper'

class Api::V1::Items::MerchantControllerTest < ActionController::TestCase
  test "#index" do
    item = create_items
    get :show, id: item.id

    assert_equal "Yeah", json["name"]
  end

  def create_items
    m =  Merchant.create(name: "Yeah")
    m2 =  Merchant.create(name: "OK")
    c = Customer.create(first_name: "Hi", last_name: "YOYO")
    c2 = Customer.create(first_name: "yo", last_name: "yo")
    inv = Invoice.create(customer_id: c.id, merchant_id: m.id)
    inv2 = Invoice.create(customer_id: c2.id, merchant_id: m2.id)
    item = Item.create(name: "Yeah", description: "also good", unit_price: 1234, merchant_id: m.id)
    Item.create(name: "YO", description: "best", unit_price: 1234, merchant_id: m2.id)
    InvoiceItem.create(quantity: 1, unit_price: 2, item_id: item.id, invoice_id: 1)
    InvoiceItem.create(quantity: 1, unit_price: 2, item_id: item.id, invoice_id: inv.id)
    item
  end
end
