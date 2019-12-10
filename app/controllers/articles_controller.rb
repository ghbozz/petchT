class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :submit, :top, :destroy]

  def index
    if params[:animal]
      @articles = policy_scope(Article)
                    .where(status: 'published')
                    .where(animal: Animal.find_by(name: params[:animal]))
    else
      @articles = policy_scope(Article).where(status: 'published')
    end

    @top_articles = Article.where(top: true)

    @pagy, @articles = pagy(
      helpers.articles_search(@articles, params).order(created_at: :desc),
      items: 12,
      link_extra: 'data-remote="true"'
    )
  end

  def show
    authorize @article

    @article_animal = @article.animal
    @recomandations = Article.where(animal: @article.animal, status: 'published').sample(3)
    @reading_duration = @article.body.split(/\W+/).count / 200
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    authorize :article, :create?

    params[:article][:tag_list] = set_tags(params[:tags])
    @article = Article.new(article_params.merge(user: current_user))

    @article.update(status: 'submitted') if params[:commit] == 'Poster'
    @article.update(status: 'published') if params[:commit] == 'Publier' && current_user.is_admin?

    if @article.save!
      params
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

    params[:article][:tag_list] = set_tags(params[:tags])
    @article.update(article_params)

    @article.update(status: 'draft') if !current_user.is_admin?
    @article.update(status: 'submitted') if params[:commit] == 'Poster'
    @article.update(status: 'published') if params[:commit] == 'Publier' && current_user.is_admin?


    if @article.save
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    authorize @article
    @article.destroy

    respond_to do |format|
      format.html { redirect_to profile_path }
      format.js
    end
  end

  def submit
    authorize @article
    @article.update(status: 'submitted')

    respond_to do |format|
      format.html { redirect_to profile_path }
      format.js
    end
  end

  def top
    authorize @article

    @article.status = 'published' if @article.status != 'published'
    @article.top = !@article.top
    @article.save

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :body, :theme, :thumbnail, :tag_list, :animal_id, images: [])
  end

  def set_tags(tags)
    tags.reject(&:empty?).join(',')
  end

end
