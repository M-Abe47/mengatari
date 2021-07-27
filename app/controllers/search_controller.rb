class SearchController < ApplicationController
  def search
		@model = params[:model]
		@content = params[:content]
    @records = Post.where('title LIKE ?', '%'+@content+'%')
  end
end
