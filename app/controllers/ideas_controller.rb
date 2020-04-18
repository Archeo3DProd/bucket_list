class IdeasController < ApplicationController
  def index
    @search_term = params['q']
    logger_info("Search completed using #{@search_term}")
  end
end
