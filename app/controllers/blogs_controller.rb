class BlogsController < ApplicationController
  expose :blog, id: :url, find_by: :url

  def show; end
end
