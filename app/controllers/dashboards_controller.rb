class DashboardsController < ApplicationController
  def user_dashboard
    authorize :dashboard, :profile?

    @articles = current_user.articles
    @pagy, @articles = pagy(
      helpers.dashboard_search(@articles, params).order(created_at: :desc),
      items: 10,
      link_extra: 'data-remote="true"'
    )

    if params[:filter_data]
      respond_to do |format|
        format.html { redirect_to profile_path }
        format.js
      end
    end
  end

  private

end
