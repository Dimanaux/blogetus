class FavouritesController < ApplicationController
  before_action :find_story, only: [:create, :destroy, :show]
  before_action :find_favourite, only: [:destroy]

  before_action :unwatch_story, only: [:create, :destroy]

  expose_decorated(:stories) { current_user.favourites.map { |f| f.story } }

  def index
  	@stories = current_user.favourites
  end

  def create
  	if already_favourite?
  		flash[:notice] = "Already in favourites"
  	else
  		@story.favourites.create(user_id: current_user.id)
  	end
  	redirect_to story_path(@story)
  end

  def destroy
    if not already_favourite?
      flash[:notice] = "Cannot remove from favourites"
    else
      @favourite.destroy
    end
    redirect_to story_path(@story)
  end

  private
  # prevent adding 1 view on each like/unlike
  def unwatch_story
    @story.views_count -= 1
    @story.save
  end

  def find_story
    @story = Story.find(params[:story_id])
  end

  def already_favourite?
    Favourite.where(user_id: current_user.id, story_id: params[:story_id]).exists?
  end

  def find_favourite
    @favourite = @story.favourites.find(params[:id])
    # @favourite = Favourite.where(user_id: current_user.id, story_id: params[:story_id])
    # @favourite = Favourite.find(params[:id])
  end
end
