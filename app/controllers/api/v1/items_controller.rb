class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id]).to_json(methods: :price, except: :unit_price)
  end

  def find
    respond_with Item.find_by(find_by_param)
  end

  def find_all
    respond_with Item.where(find_by_param)
  end
end
