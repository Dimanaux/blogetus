class StoriesController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :check_for_blog_created!

  expose_decorated :story, :find_story_by_id_or_url
  expose_decorated(:stories) { current_user.stories }

  helper_method :already_liked
  helper_method :in_favourites

  STORY_PARAMS = %i[title url content published blog_id].freeze

  def index; end

  def new; end

  def create
    story.user = current_user
    story.save

    respond_with story
  end

  def show
    @author = UserDecorator.new(story.user)
    story.views_count += 1
    story.save
  end

  def update
    story.update(story_params)
    story.save

    respond_with story
  end

  def already_liked
    story.likes.find { |l| l.user_id == current_user.id }
  end

  def in_favourites
    story.favourites.find { |f| f.user_id == current_user.id }
  end

  private

  def find_story_by_id_or_url
    if params[:id]
      Story.find(params[:id])
    else
      blog = Blog.find_by(url: params[:blog_url])
      Story.find_by(blog_id: blog.id, url: params[:url])
    end
  end

  def story_params
    params.require(:story).permit(*STORY_PARAMS)
  end

  def check_for_blog_created!
    return unless user_signed_in?

    redirect_to(new_users_blog_path, notice: t("blogs.create_first_blog")) unless current_user.blogs.any?
  end
end
