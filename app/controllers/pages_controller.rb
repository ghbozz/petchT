class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @articles = policy_scope(Article).where(status: 'published')

    @top_articles = Article.where(top: true).limit(3)

    @pagy, @articles = pagy(
      helpers.articles_search(@articles, params).order(created_at: :desc),
      items: 10,
      link_extra: 'data-remote="true"'
    )
  end
end
