require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase

  test "#index" do
    create_invoices
    invoices = Invoice.all
    get :index

    assert_response :success
    assert_equal invoices.count, json.count
  end

  test "#show" do
    inv = create_invoices
    get :show, id: inv.id

    assert_equal inv.id, json["id"]
  end

  test "#find" do
    inv = create_invoices
    get :find, customer_id: inv.customer_id

    assert_equal inv.customer_id , json["customer_id"]
  end

  test "#find_all" do
    inv = create_invoices
    get :find_all, customer_id: inv.customer_id

    assert_equal 2, json.count
  end

  def create_invoices
    Merchant.create(name: "Yeah")
    Merchant.create(name: "Yo")
    Customer.create(first_name: "Hi", last_name: "YOYO")
    Customer.create(first_name: "yo", last_name: "yo")
    Invoice.create(customer_id: 1, merchant_id: 2)
    Invoice.create(customer_id: 2, merchant_id: 3)
    Invoice.create(customer_id: 1, merchant_id: 1)
  end
end
