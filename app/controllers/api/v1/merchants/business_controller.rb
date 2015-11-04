class Api::V1::Merchants::BusinessController < ApplicationController
  respond_to :json

  def revenue
    revenue = {:revenue => Merchant.revenue(params[:id], date).to_s}
    respond_with revenue
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity])
  end

  def date 
    params.permit([:date])[:date]
  end


end
