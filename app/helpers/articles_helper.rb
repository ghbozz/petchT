module ArticlesHelper
  def articles_search(articles, params)
    if params[:query].present?
      articles = articles.search_articles(params[:query])
    end

    if params[:filter_data]
      animals = params[:filter_data].select { |k, v| v == '1' }.keys.select { |item| Animal.pluck(:name).include?(item) }
      themes = params[:themes].select { |k, v| v == '1' }.keys.select { |item| Article::THEMES.include?(item) }
      tags = params[:tags].select { |k, v| v == '1' }.keys.select { |item| TAGS.include?(item) }
      articles = articles.where(animal: animals.map { |a| Animal.find_by(name: a) }) if animals.any?
      articles = articles.where(theme: themes) if themes.any?
      articles = articles.tagged_with(tags.join(',')) if tags.any?
    end

    return articles
  end
end
