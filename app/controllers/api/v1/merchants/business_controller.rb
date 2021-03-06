class Api::V1::Merchants::BusinessController < ApplicationController
  respond_to :json

  def favorite_customer
    respond_with Customer.favorite_customer(params[:id]).first
  end

  def revenue
    revenue = {:revenue => Merchant.revenue(params[:id], date).to_s}
    respond_with revenue
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Merchant.most_items(params[:quantity].to_i)
  end

  def revenue_date
    respond_with({:total_revenue => Merchant.revenue_date(date).to_s })
  end

  def pending_invoices
    respond_with Merchant.pending_invoices(params[:id])
  end

  private 
  
  def date 
    params.permit([:date])[:date]
  end


end
