class ArticlesController < ApplicationController
  #GET /articles
  def index
    @articles = Article.all
  end
  #GET /articles/:id
  def show
    @article = Article.find(params[:id])
  end
  #GET /article/new
  def new
    @article = Article.new
  end
  #POST /article
  def create
    @article = Article.new(title: params[:article][:title], body:params[:article][:body])

    @article.save
    redirect_to @article

  end
end
