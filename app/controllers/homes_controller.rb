class HomesController < ApplicationController
  def top
    @posts = Post.all.order("id DESC")
  end

end
