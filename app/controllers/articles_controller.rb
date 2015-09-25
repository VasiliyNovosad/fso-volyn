class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :ensure_author_of_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
    @article.user = current_user
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to 'index'
  end

  private

  def article_params
    params.require(:article).permit(:title, :short_text, :text)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
