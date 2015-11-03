require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "#index" do
    create_transactions
    transs = Transaction.all
    get :index

    assert_response :success
    assert_equal transs.count, json.count
  end

  test "#show" do
    trans = create_transactions
    get :show, id: trans.id

    assert_equal trans.id, json["id"]
  end

  test "#find" do
    trans = create_transactions
    get :find, invoice_id: trans.invoice_id

    assert_equal trans.invoice_id, json["invoice_id"]
  end

  test "#find_all" do
    trans = create_transactions
    get :find_all, invoice_id: trans.invoice_id

    assert_equal 2, json.count
  end

  def create_transactions
    Merchant.create(name: "Yeah")
    Merchant.create(name: "Yo")
    Customer.create(first_name: "Hi", last_name: "YOYO")
    Customer.create(first_name: "yo", last_name: "yo")
    i1 = Invoice.create(customer_id: 1, merchant_id: 2)
    i2 = Invoice.create(customer_id: 2, merchant_id: 3)
    Invoice.create(customer_id: 1, merchant_id: 1)
    Transaction.create(invoice_id: i1.id)
    Transaction.create(invoice_id: i2.id)
    Transaction.create(invoice_id: i1.id)
  end
end
