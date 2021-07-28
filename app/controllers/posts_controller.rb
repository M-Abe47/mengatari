class PostsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page]).per(8)
    @favorite_posts = Post.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "編集しました"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "削除しました"
      redirect_to posts_path
    else
      render :index
    end
  end

  # def search
  #   @posts = @q.result
  # end

  private
  # def set_q
  #   @q = Post.ransack(params[:q])
  # end

  def post_params
    params.require(:post).permit(:title, :image, :body, :evaluation, :category, :start_time)
  end
end
