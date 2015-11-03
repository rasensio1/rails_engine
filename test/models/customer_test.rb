require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
   test "is valid" do
     cust = Customer.new(first_name: "ryan", last_name: "asen")

     assert cust.valid?
   end

   test "is invalid without first name" do
     cust = Customer.new(first_name: "ryan", last_name: "asen")
     cust.first_name = nil

     refute cust.valid?
   end

   test "is invalid without last name" do
     cust = Customer.new(first_name: "ryan", last_name: "asen")
     cust.last_name = nil

     refute cust.valid?
   end
end
