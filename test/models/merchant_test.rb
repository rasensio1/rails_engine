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
end
