class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id

  def unit_price
  end
end
