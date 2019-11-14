class Admin::DashboardsController < ApplicationController

  def admin_dashboard
    @articles = Article.all
    @pagy, @articles = pagy(
      helpers.admin_search(@articles, params),
      items: 10,
      link_extra: 'data-remote="true"'
    )
    if params[:filter_data]
      respond_to do |format|
        format.html { redirect_to admin_profile_path }
        format.js
      end
    end
    authorize :dashboard, :admin?
  end

end
