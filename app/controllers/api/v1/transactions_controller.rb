class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.all
  end

  def show 
    respond_with Transaction.find(params[:id])
  end
  
  def find
    respond_with Transaction.find_by(find_by_param)
  end

  def find_all
    respond_with Transaction.where(find_by_param)
  end
end
