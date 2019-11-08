module DashboardsHelper
  def dashboard_search(articles, params)

    if params[:filter_data]
      articles = articles.search_articles(params[:filter_data][:query]) if !params[:filter_data][:query].blank?
      articles = articles.where(theme: params[:filter_data][:theme]) if !params[:filter_data][:theme].blank?
      articles = articles.where(animal: params[:filter_data][:animal]) if !params[:filter_data][:animal].blank?
      articles = articles.where(status: params[:filter_data][:status]) if !params[:filter_data][:status].blank?
    end

    return articles
  end
end
