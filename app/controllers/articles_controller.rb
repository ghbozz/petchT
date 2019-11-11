class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :submit]
  before_action :set_tags, only: [:show, :edit]

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

    @tags = @current_tags
  end

  def new
    @article = Article.new
    authorize @article

    @tags = Tag.all
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article

    tag_ids = []

    params_tags = article_params[:tags].split(',')
    params_tags.each do |tag|
      tag_ids << Tag.find_by(name: tag).id
    end

    helpers.set_tags(tag_ids, @article)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    authorize @article

    @tags = Tag.all
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

  def set_tags 
    article_tags = ArticleTag.where(article_id: @article.id)

    final_tags = []
    article_tags.each do |item|
      final_tags << item.tag_id
    end

    @current_tags = []
    final_tags.map do |tag|
      @current_tags << Tag.find(tag)
    end

    return @current_tags
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :body, :animal, :theme, :thumbnail, :tags, :tag_ids, images: [])
  end

end
