require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do
    create_invoice_items
    iitems = InvoiceItem.all
    get :index

    assert_response :success
    assert_equal iitems.count, json.count
  end

  test "#show" do
    iitem = create_invoice_items
    get :show, id: iitem.id

    assert_equal iitem.id, json["id"]
  end

  test "#find" do
    iitem = create_invoice_items
    get :find, item_id: iitem.item_id

    assert_equal iitem.item_id, json["item_id"]
  end

  test "#find_all" do
    iitem = create_invoice_items
    get :find_all, invoice_id: iitem.invoice_id

    assert_equal 2, json.count
  end

  def create_invoice_items
    Merchant.create(name: "Yeah")
    Merchant.create(name: "Yo")
    Customer.create(first_name: "Hi", last_name: "YOYO")
    Customer.create(first_name: "yo", last_name: "yo")
    Invoice.create(customer_id: 1, merchant_id: 2)
    Invoice.create(customer_id: 2, merchant_id: 3)
    Invoice.create(customer_id: 1, merchant_id: 1)
    InvoiceItem.create(quantity: 1, unit_price: 2, item_id: 1, invoice_id: 1)
    InvoiceItem.create(quantity: 1, unit_price: 2, item_id: 1, invoice_id: 2)
    InvoiceItem.create(quantity: 1, unit_price: 2, item_id: 3, invoice_id: 2)
  end
end
