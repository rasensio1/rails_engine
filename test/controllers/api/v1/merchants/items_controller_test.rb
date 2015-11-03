require 'test_helper'

class Api::V1::Merchants::ItemsControllerTest < ActionController::TestCase

  test "#index" do
    create_items
    merch = Merchant.find_by(name: "yeah")
    get :index, id: merch.id

    assert_equal 2, json.count
  end

  def create_items
    merch = Merchant.create(name: "yeah")
    merch2 = Merchant.create(name: "ok")
    Item.create(name: "Yeah", description: "also good", unit_price: 1234, merchant_id: merch.id)
    Item.create(name: "YO", description: "best", unit_price: 1234, merchant_id: merch.id)
    Item.create(name: "OKOK", description: "best", unit_price: 1234, merchant_id: merch2.id)
  end
end
