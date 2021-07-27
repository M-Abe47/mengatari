class SearchController < ApplicationController
  def search
		@model = params[:model]
		@content = params[:content]

    if @content == []
      @records == []
    else
      @records = Post.where('title LIKE ?', '%'+@content+'%')
    end
  end
end