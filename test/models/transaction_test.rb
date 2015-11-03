require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
   test "is valid" do
     trans = Transaction.new(invoice_id: 1, credit_card_number: 1234123412341234, result: "success")
     assert trans.valid?
   end

   test "is invalid without invoice id" do
     trans = Transaction.new(invoice_id: 1, credit_card_number: 1234123412341234, result: "success")
     trans.invoice_id = nil
     refute trans.valid?
   end
end
