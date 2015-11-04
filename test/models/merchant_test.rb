require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
   test "is valid" do
     merch = Merchant.new(name: "Ryan's Cafe")

     assert merch.valid?
   end

   test "is invalid without a name" do
     merch = Merchant.new()

     refute merch.valid?
   end

   test "can get customers with pending invoices" do
     merch = create_merchant_1

     custs = Merchant.customers_with_pending_invoices(merch.id)

     assert_equal 1, custs.count 
     assert_equal "Hi", custs.first.first_name
   end


   test "can get total revenue" do
     merchant_1 = create_merchant_1

     assert_equal 8.0, Merchant.revenue(merchant_1.id)
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
