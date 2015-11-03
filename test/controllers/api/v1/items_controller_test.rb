require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#index" do
    create_merchants
    item = create_items
    items = Item.all
    get :index

    assert_response :success
    assert_equal items.count, json.count
  end

  test "#show" do
    create_merchants
    item = create_items
    get :show, id: item.id

    assert_equal item.id, json["id"]
  end

  test "#find" do
    create_merchants
    item = create_items

    get :find, name: item.name

    assert_equal item.id, json["id"]
  end

  test "#find_all" do
    create_merchants
    item = create_items

    get :find_all, merchant_id: item.merchant_id

    assert_equal 2, json.count
  end

  def create_merchants
    Merchant.create(id: 1, name: "yeah")
    Merchant.create(id: 2, name: "ok")
  end

  def create_items
    Item.create(name: "Yeah", description: "also good", unit_price: 1234, merchant_id: 1)
    Item.create(name: "YO", description: "best", unit_price: 1234, merchant_id: 2)
    Item.create(name: "Hi", description: "the best", unit_price: 1234, merchant_id: 1)
  end
end
