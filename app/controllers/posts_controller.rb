class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
    @post = Post.new()
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
        flash[:notice] = "投稿しました"
        redirect_to new_post_path
    else
        flash[:alert] = "投稿に失敗しました"
        render new_post_path
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def post_params
    params.permit(:title, :city, :field_name, :date, :details, :image)
  end

  def bookmarks
    @bookmark_posts = current_user.bookmarks_posts.includes(:user).order(created_at: :desc)
  end
end
