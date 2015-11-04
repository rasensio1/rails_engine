class Api::V1::Merchants::BusinessController < ApplicationController
  respond_to :json

  def revenue
    revenue = {:revenue => Merchant.revenue(params[:id], date).to_s}
    respond_with revenue
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity])
  end

  def revenue_date
    revenue = {:total_revenue => Merchant.revenue_date(date).to_s }
    respond_with revenue
  end


  def customers_with_pending_invoices
    respond_with Merchant.customers_with_pending_invoices(params[:id])
  end

  private 
  
  def date 
    params.permit([:date])[:date]
  end


end
