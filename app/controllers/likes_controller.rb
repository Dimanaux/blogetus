class LikesController < ApplicationController
  before_action :find_story

  def create
    if already_liked?
      flash[:notice] = "Cannot like twice"
    else
      @story.likes.create(user_id: current_user.id)
    end
    redirect_to story_path(@story)
  end

  private
  def find_story
    @story = Story.find(params[:story_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, story_id: params[:story_id]).exists?
  end
end
