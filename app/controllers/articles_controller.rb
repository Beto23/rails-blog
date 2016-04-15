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
    @article = Article.new(article_params)

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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    #UPDATE
    #@article.update_attributes({title: 'Nuevo titulo'})
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private

  def article_params
    #Este método solo permite insertar los campos title y body a la base de datos
    #El campo visit_counts no es permitido, con esto nuestra app es segura
    params.require(:article).permit(:title, :body)
  end
end
