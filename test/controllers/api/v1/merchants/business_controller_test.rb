require 'test_helper'

class Api::V1::Merchants::BusinessControllerTest < ActionController::TestCase

  test "#revenue" do
    merch = create_merchant_1

    get :revenue, id: merch.id

    assert_response :success
    assert_equal 800, json.first["revenue"]
  end

   def create_merchant_1
     m = Merchant.create(name: "First")
     c1 = Customer.create(first_name: "Hi", last_name: "YOYO")
     c2 = Customer.create(first_name: "yo", last_name: "yo")
     i1 = Invoice.create(customer_id: c1.id, merchant_id: m.id)
     item = Item.create(name: "item", description: "ok", unit_price: 100, merchant_id: m.id)
     InvoiceItem.create(quantity: 2, unit_price: 100, item_id: item.id, invoice_id: i1.id)
     InvoiceItem.create(quantity: 1, unit_price: 300, item_id: item.id, invoice_id: i1.id)
     i3 = Invoice.create(customer_id: c1.id, merchant_id: m.id)
     InvoiceItem.create(quantity: 1, unit_price: 1000, item_id: item.id, invoice_id: i3.id)

     i2 = Invoice.create(customer_id: c2.id, merchant_id: m.id)
     InvoiceItem.create(quantity: 1, unit_price: 300, item_id: item.id, invoice_id: i1.id)

     Transaction.create(invoice_id: i1.id, result: "success")
     Transaction.create(invoice_id: i1.id, result: "failed")
     Transaction.create(invoice_id: i2.id, result: "success")
     Transaction.create(invoice_id: i3.id, result: "failed")
     m
   end
end
