class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] #metodo de devise para validar usuario
  #before_action :validate_user, except: [:show, :index] #metodo de ruby para validar usuario

  before_action :set_article, except: [:index, :new, :create]

  #GET /articles
  def index
    # Obtiene todos los registros SELECT * FROM articles
    @articles = Article.all
  end

  #GET /articles/:id
  def show
    @article.update_visits_count
    @comment = Comment.new
  end

  #GET /article/new
  def new
    @article = Article.new
  end

  #POST /article
  def create
    #INSERT INTO
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  #DELETE /articles/:id
  def destroy
    #DELETE FROM articles
    @article.destroy #destroy elimina el objeto de la base de datos
    redirect_to articles_path
  end

  def edit

  end

  def update
    #UPDATE
    #@article.update_attributes({title: 'Nuevo titulo'})
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def validate_user
    redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
  end
  def article_params
    #Este método solo permite insertar los campos title y body a la base de datos
    #El campo visit_counts no es permitido, con esto nuestra app es segura
    params.require(:article).permit(:title, :body)
  end
end
