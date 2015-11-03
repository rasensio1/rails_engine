require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#index" do
    create_merchants
    merchs = Merchant.all
    get :index

    assert_response :success
    assert_equal merchs.count, json.count
  end

  test "#show" do
    merch = create_merchants
    get :show, id: merch.id

    assert_equal merch.id, json["id"]
  end

  test "#find" do
    merch = create_merchants
    get :find, name: merch.name

    assert_equal merch.name, json["name"]
  end

  test "#find_all" do
    merch = create_merchants
    get :find_all, name: merch.name

    assert_equal 2, json.count
  end

  def create_merchants
    Merchant.create(name: "Yeah")
    Merchant.create(name: "Yo")
    Merchant.create(name: "Hi")
    Merchant.create(name: "Hi")
  end
end
