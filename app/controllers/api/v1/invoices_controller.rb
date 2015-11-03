class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def find
    respond_with Invoice.find_by(find_by_param)
  end

  def find_all
    respond_with Invoice.where(find_by_param)
  end
end
