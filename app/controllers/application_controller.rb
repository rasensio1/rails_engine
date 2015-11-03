class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_default_response_format

  def find_by_param
    data = params.first
    { format_search(data[0]) => format_param(data[1]) }
  end

  private
    def set_default_response_format
      request.format = :json
    end

    def format_param(word)
      word.split.map(&:capitalize).join(' ')
    end

    def format_search(word)
      word.downcase
    end
end
