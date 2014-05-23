class ArticlesController < ApplicationController
  def index
    @articles = Article.all 
    @page_title = "All articles"
  end

  def show
    @article = Article.find(params[:id]) 
    @page_title = @article.title
  end

  def new
    
  end

end
