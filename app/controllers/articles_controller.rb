class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])

    if current_user_article
      @article
    else
      redirect_to @article
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params) && current_user_article
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if current_user_article
      @article.destroy
      redirect_to root_path
    else
      redirect_to @article
    end
  end

  def current_user_article
    @article.user_id == current_user.id
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
