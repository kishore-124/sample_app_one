class PostsController < ApplicationController

  include GetPost
  include GetComment

  def index
    @pagy, @posts = pagy_array(get_post_lists, items: 20)
  end

  def show
    @post = get_post(params[:id])
    @pagy, @comments = pagy_array( get_comment_lists(params[:id]), items: 20)
  end
end
