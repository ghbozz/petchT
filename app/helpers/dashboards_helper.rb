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
      articles = articles.where(top: true) if params[:filter_data][:top] == 'Yes'
    end

    return articles
  end

  def cards_filter(cards, params)

    if params[:cards_filter]
      cards = cards.cards_search(params[:cards_filter][:query]) if !params[:cards_filter][:query].blank?
      cards = cards.where(animal: Animal.find_by(name: params[:cards_filter][:animal])) if !params[:cards_filter][:animal].blank?
      cards = cards.where(status: params[:cards_filter][:status]) if !params[:cards_filter][:status].blank?
    end

    return cards
  end

  # DEVISE

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
