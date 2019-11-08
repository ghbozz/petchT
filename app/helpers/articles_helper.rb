module ArticlesHelper
  def index_search(articles, params)
    if params[:query].present?
      articles = articles.search_articles(params[:query])
    end

    if params[:filter_data]
      animals = params[:filter_data].select { |k, v| v == '1' }.keys.select { |item| Article::ANIMALS.include?(item) }
      themes = params[:filter_data].select { |k, v| v == '1' }.keys.select { |item| Article::THEMES.include?(item) }
      articles = articles.where(animal: animals) if animals.any?
      articles = articles.where(theme: themes) if themes.any?
    end

    return articles
  end

  def set_tags(ids, article)
    ids.reject(&:empty?).each do |id|
      ArticleTag.create(article: article, tag: Tag.find(id))
    end
  end
end
