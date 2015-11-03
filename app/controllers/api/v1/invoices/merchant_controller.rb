class Api::V1::Invoices::MerchantController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.joins(:invoices).where("invoices.merchant_id" => params[:id]).uniq
  end
end
