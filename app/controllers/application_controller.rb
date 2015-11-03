class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_default_response_format

  def find_by_param
    data = params.first
    { data[0] => data[1] }
  end

  private
    def set_default_response_format
      request.format = :json
    end
end
