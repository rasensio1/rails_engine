require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#index" do
    Merchant.create(name: "Hi")
    Merchant.create(name: "Yeah")
    Merchant.create(name: "Yo")
    merchs = Merchant.all
    get :index

    assert_response :success
    assert_equal merchs.count, json.count
  end

  test "#show" do
    merch = Merchant.create(name: "Hi")
    Merchant.create(name: "Yeah")
    Merchant.create(name: "Yo")
    get :show, id: merch.id

    assert_equal merch.id, json["id"]
  end

  test "#find" do
    merch = Merchant.create(name: "Hi")
    Merchant.create(name: "Yeah")
    Merchant.create(name: "Yo")
    get :find, name: merch.name

    assert_equal merch.id, json["id"]
  end

  test "#find_all" do
    merch = Merchant.create(name: "Hi")
    Merchant.create(name: "Hi")
    Merchant.create(name: "Yo")
    get :find_all, name: merch.name

    assert_equal 2, json.count
  end
end
