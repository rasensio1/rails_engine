class Api::V1::Items::MerchantController < ApplicationController
  respond_to :json

  def show 
    respond_with Merchant.joins(:items).where("items.id" =>  params[:id]).first
  end
end
