class Api::V1::Customers::BusinessController < ApplicationController
  respond_to :json

  def favorite_merchant
    respond_with Merchant.favorite_merchant(params[:id]).first
  end
end
