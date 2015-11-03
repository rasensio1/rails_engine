require 'test_helper'

class ItemTest < ActiveSupport::TestCase
   test "is valid" do
     item = Item.new(name: "thing", description: "fast", unit_price: 3, merchant_id: 1)

     assert item.valid?
   end

   test "is invalid without a name" do
     item = Item.new(name: "thing", description: "fast", unit_price: 3, merchant_id: 1)
     item.name = nil

     refute item.valid?
   end

   test "is invalid without a description" do
     item = Item.new(name: "thing", description: "fast", unit_price: 3, merchant_id: 1)
     item.description = nil

     refute item.valid?
   end
   test "is invalid without a price" do
     item = Item.new(name: "thing", description: "fast", unit_price: 3, merchant_id: 1)
     item.unit_price = nil

     refute item.valid?
   end
   test "is invalid without a merchant_id" do
     item = Item.new(name: "thing", description: "fast", unit_price: 3, merchant_id: 1)
     item.merchant_id = nil

     refute item.valid?
   end
end
