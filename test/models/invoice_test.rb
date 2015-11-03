require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
   test "is valid" do
     inv = Invoice.new(status: "shipped", customer_id: 1, merchant_id: 2)
     assert inv.valid?
   end

   test "is invalid without customer id" do
     inv = Invoice.new(status: "shipped", customer_id: 1, merchant_id: 2)
     inv.customer_id = nil
     refute inv.valid?
   end

   test "is invalid without merchant id" do
     inv = Invoice.new(status: "shipped", customer_id: 1, merchant_id: 2)
     inv.merchant_id = nil
     refute inv.valid?
   end
end
