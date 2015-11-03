require 'test_helper'

class Api::V1::Invoices::ItemsControllerTest < ActionController::TestCase
  test "#index" do
    inv = create_items

    get :index, id: inv.id

    assert_equal 2, json.count
  end
  
  def create_items
    m =  Merchant.create(name: "Yeah")
    m2 = Merchant.create(name: "Yo")
    Customer.create(first_name: "Hi", last_name: "YOYO")
    Customer.create(first_name: "yo", last_name: "yo")
    inv = Invoice.create(customer_id: 1, merchant_id: 2)
    inv2 = Invoice.create(customer_id: 2, merchant_id: 3)
    Invoice.create(customer_id: 1, merchant_id: 1)
    i = Item.create(name: "Yeah", description: "also good", unit_price: 1234, merchant_id: m.id)
    i2 = Item.create(name: "YO", description: "best", unit_price: 1234, merchant_id: m.id)
    i3 = Item.create(name: "Hi", description: "the best", unit_price: 1234, merchant_id: m2.id)
    InvoiceItem.create(quantity: 1, unit_price: 2, item_id: i.id, invoice_id: inv.id)
    InvoiceItem.create(quantity: 1, unit_price: 2, item_id: i2.id, invoice_id: inv.id)
    InvoiceItem.create(quantity: 1, unit_price: 2, item_id: 3, invoice_id: inv2.id)
    inv
  end
end
