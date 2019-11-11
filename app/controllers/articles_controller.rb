class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :submit]

  def index
    @articles = policy_scope(Article).where(status: 'published')
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
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    # helpers.set_tags(params[:article][:tag_ids], @article)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    @article.update(article_params)
    @article.update(status: 'draft')
    if @article.save
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def submit
    authorize @article
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
