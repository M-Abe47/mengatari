class SearchController < ApplicationController
  def search
		@model = params[:model]
		@content = params[:content]

    if @content.present?
      @records = Post.where('title LIKE ? OR category LIKE ?', '%'+@content+'%','%'+@content+'%')
    else
      @records = Post.where('title LIKE ?', @content)
    end
  end
end