require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
   test "is valid" do
     iitem = InvoiceItem.new(quantity: 3, unit_price: 10, item_id: 1, invoice_id: 2)

     assert iitem.valid?
   end
   
   test "is invalid without quantity" do
     iitem = InvoiceItem.new(quantity: 3, unit_price: 10, item_id: 1, invoice_id: 2)
     iitem.quantity = nil

     refute iitem.valid?
   end

   test "is invalid without price" do
     iitem = InvoiceItem.new(quantity: 3, unit_price: 10, item_id: 1, invoice_id: 2)
     iitem.unit_price = nil

     refute iitem.valid?
   end

   test "is invalid without item_id" do
     iitem = InvoiceItem.new(quantity: 3, unit_price: 10, item_id: 1, invoice_id: 2)
     iitem.item_id = nil

     refute iitem.valid?
   end

   test "is invalid without invoice_id" do
     iitem = InvoiceItem.new(quantity: 3, unit_price: 10, item_id: 1, invoice_id: 2)
     iitem.invoice_id = nil

     refute iitem.valid?
   end
end
