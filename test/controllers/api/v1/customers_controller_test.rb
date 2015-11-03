require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#index" do
    create_customers
    customers = Customer.all
    get :index

    assert_response :success
    assert_equal customers.count, json.count
  end

  test "#show" do
    cust = create_customers
    get :show, id: cust.id

    assert_equal cust.id, json["id"]
  end

  test "#find" do
    cust = create_customers
    get :find, first_name: cust.first_name

    assert_equal cust.first_name, json["first_name"]
  end

  test "#find_all" do
    cust = create_customers
    get :find_all, first_name: cust.first_name

    assert_equal 2, json.count
  end

  def create_customers
    Customer.create(first_name: "Hi", last_name: "YOYO")
    Customer.create(first_name: "yo", last_name: "yo")
    Customer.create(first_name: "yeah", last_name: "yeah")
    Customer.create(first_name: "Hi", last_name: "Hi")
  end

end
