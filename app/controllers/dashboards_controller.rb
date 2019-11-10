class DashboardsController < ApplicationController

  def user_dashboard
    @articles = current_user.articles
    @pagy, @articles = pagy(
      helpers.dashboard_search(@articles, params),
      items: 10,
      link_extra: 'data-remote="true"'
    )

    @article = Article.new
    @card = Card.new

    if params[:filter_data]
      respond_to do |format|
        format.html { redirect_to profile_path }
        format.js
      end
    end
    authorize :dashboard, :profile?
  end

  private

end
