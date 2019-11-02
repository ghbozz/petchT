class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :submit]

  def index
    @articles = Article.where(status: 'published')
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @article.update(article_params)
    @article.update(status: 'draft')
    @article.save!
    redirect_to article_path(@article)
  end

  def submit
    @article.update(status: 'submitted')
    redirect_to profile_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :body, :animal, :theme, :thumbnail, images: [])
  end
end
