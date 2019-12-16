module ArticlesHelper
  def articles_search(articles, params)
    if params[:query].present?
      articles = articles.search_articles(params[:query])
    end

    if params[:animals]
      animals = params[:animals].select { |k, v| v == '1' }
                                    .keys
      if animals.any?
        articles = articles.where(animal: animals.map { |a| Animal.find_by(name: a) })
      end
    end

    if params[:themes]
      themes = params[:themes].select { |k, v| v == '1' }
                              .keys

      articles = articles.where(theme: themes) if themes.any?
    end

    if params[:tags]
      tags = params[:tags].select { |k, v| v == '1' }
                          .keys

      articles = articles.tagged_with(tags.join(',')) if tags.any?
    end


    return articles
  end
end
