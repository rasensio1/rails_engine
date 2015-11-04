require 'test_helper'

class Api::V1::Merchants::BusinessControllerTest < ActionController::TestCase

  test "#revenue" do
    merch = create_merchant_1

    get :revenue, id: merch.id

    assert_response :success
    assert_equal "8.0", json["revenue"]
  end

  test "#most_revenue" do
    merch = create_merchant_1
    merch2 = create_merchant_2
    merch3 = create_merchant_3

    get :most_revenue, quantity: 2

    assert_response :success
    assert_equal 800, json.first["revenue"]
    assert_equal 300, json.second["revenue"]
  end

  test "#most_items" do
    merch = create_merchant_1
    merch2 = create_merchant_2
    merch3 = create_merchant_3

    get :most_items , quantity: 2

    assert_response :success
    assert_equal "First", json.first["name"]
    assert_equal "Another", json.second["name"]
  end

  test "#favorite_customer" do
    merch = create_merchant_2

    get :favorite_customer, id: merch.id

    assert_response :success
    assert_equal "John", json["first_name"]
  end

  test "#pending_invoices" do
    skip
    merch = create_merchant_1

    get :pending_invoices, id: merch.id

    assert_response :success
    assert_equal "Hi", json.first["first_name"]
  end

  test "#total revenue for date" do
    merch = create_merchant_1

    get :revenue_date, date: "2012-03-16 11:55:05"

    assert_response :success
    assert_equal "8.0", json["total_revenue"]
  end

   def create_merchant_1
     m = Merchant.create(name: "First")
     c1 = Customer.create(first_name: "Hi", last_name: "YOYO")
     c2 = Customer.create(first_name: "yo", last_name: "yo")
     i1 = Invoice.create(customer_id: c1.id, merchant_id: m.id, created_at: "2012-03-16 11:55:05")
     item = Item.create(name: "item", description: "ok", unit_price: 100, merchant_id: m.id)
     InvoiceItem.create(quantity: 2, unit_price: 100, item_id: item.id, invoice_id: i1.id)
     InvoiceItem.create(quantity: 1, unit_price: 300, item_id: item.id, invoice_id: i1.id)
     i3 = Invoice.create(customer_id: c1.id, merchant_id: m.id, created_at: "2012-03-16 11:55:05")
     InvoiceItem.create(quantity: 1, unit_price: 1000, item_id: item.id, invoice_id: i3.id)

     i2 = Invoice.create(customer_id: c2.id, merchant_id: m.id, created_at: "2012-03-16 11:55:05")
     InvoiceItem.create(quantity: 1, unit_price: 300, item_id: item.id, invoice_id: i1.id)

     Transaction.create(invoice_id: i1.id, result: "success")
     Transaction.create(invoice_id: i1.id, result: "failed")
     Transaction.create(invoice_id: i2.id, result: "success")
     Transaction.create(invoice_id: i3.id, result: "failed")
     m
   end

   def create_merchant_2
     m = Merchant.create(name: "Another")
     c = Customer.create(first_name: "John", last_name: "YOYO")
     i = Invoice.create(customer_id: c.id, merchant_id: m.id)
     item = Item.create(name: "item", description: "ok", unit_price: 100, merchant_id: m.id)
     InvoiceItem.create(quantity: 1, unit_price: 300, item_id: item.id, invoice_id: i.id)
     Transaction.create(invoice_id: i.id, result: "success")
     m
   end

   def create_merchant_3
     Merchant.create(name: "Brian")
   end
end
