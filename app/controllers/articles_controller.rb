class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :submit, :destroy]

  def index
    if params[:animal]
      @articles = policy_scope(Article)
                    .where(status: 'published')
                    .where(animal: Animal.find_by(name: params[:animal]))
    else
      @articles = policy_scope(Article).where(status: 'published')
    end


    @pagy, @articles = pagy(
      helpers.index_search(@articles, params),
      items: 10,
      link_extra: 'data-remote="true"'
    )
  end

  def show
    authorize @article

    @article_animal = @article.animal
    @recomandations = Article.where(theme: @article.theme, animal: @article.animal).sample(3)
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    params[:article][:tag_list] = set_tags(params[:tags])
    @article = Article.new(article_params.merge(user: current_user))
    @article.animal = Animal.find_by(name: params[:article][:animal])
    @article.update(status: 'submitted') if params[:commit] == 'Poster'

    authorize @article
    if @article.save
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
    params[:article][:tag_list] = set_tags(params[:tags])
    @article.update(article_params.merge(status: 'draft'))
    @article.update(status: 'submitted') if params[:commit] == 'Poster'

    authorize @article

    if @article.save
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    authorize @article
    @article.destroy
    redirect_to profile_path
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
    params.require(:article).permit(:title, :subtitle, :body, :theme, :thumbnail, :tag_list, images: [])
  end

  def set_tags(tags)
    tags.reject(&:empty?).join(',')
  end

end
