class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    respond_with Customer.find_by(find_by_param)
  end

  def find_all
    respond_with Customer.where(find_by_param)
  end
end
