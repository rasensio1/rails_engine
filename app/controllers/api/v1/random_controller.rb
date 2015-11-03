class Api::V1::RandomController < ApplicationController
  respond_to :json

  def show
    respond_with constant.all.sample
  end


  private
  def constant
    params[:object].chomp('s').capitalize.constantize
  end
end
