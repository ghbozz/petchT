class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :submit]

  def index
    @articles = Article.where(status: 'published')
    @articles = search_n_filter(@articles, params)
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

  def search_n_filter(articles, params)
    if params[:query].present?
      articles = articles.search_articles(params[:query])
    end

    if params[:filter_data]
      animals = params[:filter_data].select { |k, v| v == '1' }.keys.select { |item| Article::ANIMALS.include?(item) }
      themes = params[:filter_data].select { |k, v| v == '1' }.keys.select { |item| Article::THEMES.include?(item) }
      articles = articles.where(animal: animals) if animals.any?
      articles = articles.where(theme: themes) if themes.any?
    end

    articles
  end

end
