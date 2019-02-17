module Users
  class BlogsController < ApplicationController
    before_action :authenticate_user!

    expose(:blog)

    def new; end

    def edit; end

    def update
      blog.update(blog_params)

      respond_with blog, location: blog_path(url: blog.url)
    end

    def create
      blog.user = current_user
      blog.save

      respond_with blog, location: blog_path(url: blog.url)
    end

    private

    def blog_params
      params.require(:blog).permit(:title, :url)
    end
  end
end
