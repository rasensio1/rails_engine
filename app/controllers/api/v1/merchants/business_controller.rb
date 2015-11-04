class Api::V1::Merchants::BusinessController < ApplicationController
  respond_to :json

  def revenue
    respond_with [{merchant_id: params[:id], revenue: Merchant.revenue(params[:id])}]
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity])
  end


end
