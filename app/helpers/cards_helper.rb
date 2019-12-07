module CardsHelper
  def cards_search(cards, params)
    if params[:filter_data]

      if params[:filter_data][:query].present?
        cards = cards.cards_search(params[:filter_data][:query])
      end

      if params[:animals]
        animals = Animal.where(name: params[:animals].select { |k, v| v == '1' }.keys)
        cards = cards.where(animal: animals) if !animals.empty?
      end

    end

    return cards
  end
end
