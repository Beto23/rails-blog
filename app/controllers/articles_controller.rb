class ArticlesController < ApplicationController
  #GET /articles
  def index
    # Obtiene todos los registros SELECT * FROM articles
    @articles = Article.all
  end

  #GET /articles/:id
  def show
    #Encuentra un registro por id
    @article = Article.find(params[:id])
    #where
    #Article.where.not("id = ?", params[:id])
  end

  #GET /article/new
  def new
    @article = Article.new
  end

  #POST /article
  def create
    #INSERT INTO
    @article = Article.new(title: params[:article][:title], body:params[:article][:body])

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  #DELETE /articles/:id
  def destroy
    #DELETE FROM articles
    @article = Article.find(params[:id])
    @article.destroy #destroy elimina el objeto de la base de datos
    redirect_to articles_path
  end
end
