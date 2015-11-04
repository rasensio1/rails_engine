class Api::V1::Merchants::BusinessController < ApplicationController
  respond_to :json

  def revenue
    respond_with [{merchant_id: params[:id], revenue: Merchant.revenue(params[:id])}]
  end
end
