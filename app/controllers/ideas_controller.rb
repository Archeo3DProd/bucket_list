class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    logger.info("Search completed using #{@search_term}")
    @ideas = Idea.search(@search_term)
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
  end

  def create
    idea = Idea.new(idea_params)
    idea.save!
    redirect_to ideas_path
  end

  def edit
    id = params[:id]
    @idea = Idea.find(id)
  end

  def update
    idea = Idea.find(params[:id])
    idea.update(idea_params)

    redirect_to account_ideas_path
  end

  private

  def idea_params
    params.permit(:title, :done_count, :description, :photo_url)
  end
end
