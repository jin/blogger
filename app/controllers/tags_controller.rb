class TagsController < ApplicationController
  def index
    @tags = Tag.all 
    @page_title = "All tags"
  end

  def show
    @tag = Tag.find(params[:id]) 
    @page_title = "Articles tagged with: " + @tag.name
  end
end
