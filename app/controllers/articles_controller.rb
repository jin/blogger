class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all 
    @page_title = "All articles"
  end

  def show
    @article = Article.find(params[:id]) 
    @page_title = @article.title

    @comment = Comment.new
    @comment.article_id = @article.id

  end

  def new
    @article = Article.new 
    @page_title = "Create a new article"
  end

  def edit
    @page_title = "Edit article"
    @article = Article.find(params[:id]) 
  end

  def update
    @article = Article.find(params[:id])    
    @article.update(article_params)

    flash.notice = "Successfully updated article."

    redirect_to article_path(@article.id)
  end

  def create
    @article = Article.create(article_params)

    flash.notice = "Successfully created article."

    redirect_to article_path(@article.id)
  end

  def destroy
    Article.find(params[:id]).destroy! 

    flash.notice = "Sucessfully deleted article."

    redirect_to articles_path
  end
end
