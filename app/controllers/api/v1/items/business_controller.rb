class Api::V1::Items::BusinessController < ApplicationController
  respond_to :json

  def most_revenue
    respond_with Item.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Item.most_items(params[:quantity])
  end
end
