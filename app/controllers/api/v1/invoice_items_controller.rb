class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json
  def index
    respond_with InvoiceItem.all.to_json(methods: :price, except: :unit_price)
  end

  def show
    respond_with InvoiceItem.find(params[:id]).to_json(methods: :price, except: :unit_price)
  end

  def find
    respond_with InvoiceItem.find_by(find_by_param).to_json(methods: :price, except: :unit_price)
  end

  def find_all
    respond_with InvoiceItem.where(find_by_param).to_json(methods: :price, except: :unit_price)
  end
end
