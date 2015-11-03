require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#index" do
    Customer.create(first_name: "hi", last_name: "hi")
    Customer.create(first_name: "yo", last_name: "yo")
    Customer.create(first_name: "yeah", last_name: "yeah")
    customers = Customer.all
    get :index

    assert_response :success
    assert_equal customers.count, json.count
  end

  test "#show" do
    cust = Customer.create(first_name: "hi", last_name: "hi")
    Customer.create(first_name: "yeah")
    Customer.create(first_name: "yo")
    get :show, id: cust.id

    assert_equal cust.id, json["id"]
  end

  test "#find" do
    cust = Customer.create(first_name: "Hi", last_name: "Hi")
    Customer.create(first_name: "yeah")
    Customer.create(first_name: "yo")
    get :find, first_name: cust.first_name

    assert_equal cust.id, json["id"]
  end

  test "#find_all" do
    cust = Customer.create(first_name: "Hi", last_name: "Hi")
    Customer.create(first_name: "Hi", last_name: "YOYO")
    Customer.create(first_name: "yeah")
    Customer.create(first_name: "yo")
    get :find_all, first_name: cust.first_name

    assert_equal 2, json.count
  end
end
