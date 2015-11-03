require 'test_helper'

class Api::V1::InvoiceItems::InvoiceControllerTest < ActionController::TestCase
  test "#index" do
    iitem= create_invoices
    cust = Customer.find_by(first_name: "Hi")

    get :show, id: iitem.id

    assert_equal cust.id, json["customer_id"]
  end

  def create_invoices
    m =  Merchant.create(name: "Yeah")
    m2 =  Merchant.create(name: "OK")
    c = Customer.create(first_name: "Hi", last_name: "YOYO")
    c2 = Customer.create(first_name: "yo", last_name: "yo")
    inv = Invoice.create(customer_id: c.id, merchant_id: m.id)
    inv2 = Invoice.create(customer_id: c2.id, merchant_id: m2.id)
    InvoiceItem.create(quantity: 1, unit_price: 2, item_id: 1, invoice_id: 1)
    InvoiceItem.create(quantity: 1, unit_price: 2, item_id: 1, invoice_id: inv.id)
  end
end
