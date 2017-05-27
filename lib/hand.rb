require_relative 'deck'

class Hand
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    score = 0
      @cards.each do |value|
        if value.include?("J") || value.include?("Q") || value.include?("K")
          score += 10
        elsif value.include?("A") && score < 11
          score += 11
        elsif value.include?("A") && score >= 11
          score += 1
        else
          score += value.to_i
        end
      end

      @cards.each do |value|
        if score > 21 && value.include?("A")
          score -= 10
        end
      end
    score
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
hand.calculate_hand
