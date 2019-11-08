class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :submit]

  def index
    @articles = Article.where(status: 'published')
    @pagy, @articles = pagy(
      helpers.index_search(@articles, params),
      items: 10,
      link_extra: 'data-remote="true"'
    )

    if params[:query] || params[:filter]
      respond_to do |format|
        format.html { redirect_to articles_path }
        format.js
      end
    end
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    helpers.set_tags(params[:article][:tag_ids], @article)

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
    params.require(:article).permit(:title, :subtitle, :body, :animal, :theme, :thumbnail, :tag_ids, images: [])
  end

end
