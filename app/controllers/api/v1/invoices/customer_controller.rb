class Api::V1::Invoices::CustomerController < ApplicationController
  respond_to :json

  def show
    respond_with Customer.joins(:invoices).where("invoices.id" => params[:id]).first
  end
end
