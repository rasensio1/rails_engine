class Api::V1::Invoices::MerchantController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.joins(:invoices).where("invoices.id" => params[:id]).first
  end
end
