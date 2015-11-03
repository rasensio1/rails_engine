class Api::V1::Merchants::ItemsController < ApplicationController
  respond_to :json
  before_filter :set_default_response_format

  def index 
    respond_with Item.where(merchant_id: params[:id])
  end
end
