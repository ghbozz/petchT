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

  def articles_filter(articles, params)

    if params[:articles_filter]
      author = User.find_by_email(params[:articles_filter][:user])
      articles = articles.search_articles(params[:articles_filter][:query]) if !params[:articles_filter][:query].blank?
      articles = articles.where(theme: params[:articles_filter][:theme]) if !params[:articles_filter][:theme].blank?
      articles = articles.where(animal: Animal.find_by(name: params[:articles_filter][:animal])) if !params[:articles_filter][:animal].blank?
      articles = articles.where(status: params[:articles_filter][:status]) if !params[:articles_filter][:status].blank?
      articles = articles.where(user: author) if !params[:articles_filter][:user].blank?
      articles = articles.where(top: true) if params[:articles_filter][:top] == 'Oui'
      articles = articles.where(top: false) if params[:articles_filter][:top] == 'Non'
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

  def brands_filter(brands, params)

    if params[:brands_filter]
      brands = brands.brands_search(params[:brands_filter][:query]) if !params[:brands_filter][:query].blank?
      # brands = brands.where(animal: Animal.find_by(name: params[:cards_filter][:animal])) if !params[:cards_filter][:animal].blank?
      # brands = brands.where(status: params[:cards_filter][:status]) if !params[:cards_filter][:status].blank?
    end

    return brands
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
