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
    @article = Article.new 
  end

  def create
    @article = Article.new
    @article.title, @article.body = params[:article][:title], params[:article][:body]
    @article.save!
    redirect_to article_path(@article.id)
  end

end
