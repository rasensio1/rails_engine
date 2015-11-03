require 'test_helper'

class Api::V1::Invoices::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do
    inv = create_invoice_items

    get :index, id: inv.id

    assert_equal 2, json.count
  end

  def create_invoice_items
    Merchant.create(name: "Yeah")
    Merchant.create(name: "Yo")
    Customer.create(first_name: "Hi", last_name: "YOYO")
    Customer.create(first_name: "yo", last_name: "yo")
    inv = Invoice.create(customer_id: 1, merchant_id: 2)
    Invoice.create(customer_id: 2, merchant_id: 3)
    Invoice.create(customer_id: 1, merchant_id: 1)
    InvoiceItem.create(quantity: 1, unit_price: 2, item_id: 1, invoice_id: inv.id)
    InvoiceItem.create(quantity: 1, unit_price: 2, item_id: 1, invoice_id: inv.id)
    InvoiceItem.create(quantity: 1, unit_price: 2, item_id: 3, invoice_id: 2)
    inv
  end
end
