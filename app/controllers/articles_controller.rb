class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all 
    @page_title = "All articles"
  end

  def show
    @article = Article.find(params[:id]) 
    @page_title = @article.title
  end

  def new
    @article = Article.new 
  end

  def create
    @article = Article.create(article_params)
    redirect_to article_path(@article.id)
  end

  def destroy
    Article.find(params[:id]).destroy! 
    redirect_to articles_path
  end
end
