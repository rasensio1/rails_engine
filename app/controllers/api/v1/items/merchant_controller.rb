class Api::V1::Items::MerchantController < ApplicationController
  respond_to :json

  def show 
    respond_with Merchant.items(params[:id])
  end
end
