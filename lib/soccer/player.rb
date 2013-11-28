module Soccer
  class Player
    attr_accessor :yellow_cards, :red_card

    def initialize
      @yellow_cards = []
      @red_card = nil
    end

    def add_card(card)
      if card.kind_of? Soccer::Card::Yellow
        yellow_cards << card
      else
        red_card = card
      end
    end
  end
end
