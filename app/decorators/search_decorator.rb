class SearchDecorator < BaseDecorator
  
  def term_value
    if term.blank? || term == "-"
      I18n.t 'no_available'
    else
      term
    end
  end

  def filter_value
    filter
  end

  def response_value 
    JSON.pretty_generate(response)
  end
end