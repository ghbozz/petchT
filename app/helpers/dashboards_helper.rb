module DashboardsHelper
  def dashboard_search(articles, params)

    if params[:filter_data]
      articles = articles.search_articles(params[:filter_data][:query]) if !params[:filter_data][:query].blank?
      articles = articles.where(theme: params[:filter_data][:theme]) if !params[:filter_data][:theme].blank?
      articles = articles.where(animal: Animal.find_by(name: params[:filter_data][:animal])) if !params[:filter_data][:animal].blank?
      articles = articles.where(status: params[:filter_data][:status]) if !params[:filter_data][:status].blank?
    end

    return articles
  end

  def admin_search(articles, params)

    if params[:filter_data]
      author = User.find_by_email(params[:filter_data][:user])
      articles = articles.search_articles(params[:filter_data][:query]) if !params[:filter_data][:query].blank?
      articles = articles.where(theme: params[:filter_data][:theme]) if !params[:filter_data][:theme].blank?
      articles = articles.where(animal: Animal.find_by(name: params[:filter_data][:animal])) if !params[:filter_data][:animal].blank?
      articles = articles.where(status: params[:filter_data][:status]) if !params[:filter_data][:status].blank?
      articles = articles.where(user: author) if !params[:filter_data][:user].blank?
    end

    return articles
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
