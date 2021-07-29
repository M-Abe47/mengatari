class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:show]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(8)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "プロフィールを編集しました"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
