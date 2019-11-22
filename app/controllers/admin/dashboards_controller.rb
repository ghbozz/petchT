class Admin::DashboardsController < ApplicationController

  def admin_dashboard
    authorize :dashboard, :admin?

    @articles = Article.where(id: articles_select)
    @pagy_articles, @articles = pagy(
      helpers.admin_search(@articles, params),
      items: 10,
      link_extra: 'data-remote="true"'
    )

    @cards = Card.all

    if params[:filter_data]
      respond_to do |format|
        format.html { redirect_to admin_profile_path }
        format.js
      end
    end
  end

  private

  def articles_select
    articles = Article.all.select do |a|
      a.user == current_user || a.status == 'submitted' || a.status == 'published'
    end

    return articles.map(&:id)
  end

end
