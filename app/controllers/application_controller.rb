class ApplicationController < ActionController::Base
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
    return word if params.first[0] == "description"
    return (word.to_f * 100).ceil if params.first[0] == "unit_price"

    if word != "shipped" && word != "success" && word != "failed"
      word.split.map do |word|
        if word != "and"
          word.capitalize
        else
          word
        end
      end.join(' ')
    else
      word
    end
  end

  def format_search(word)
    word.downcase
  end
end
