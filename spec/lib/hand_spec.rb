require "spec_helper"

describe Hand do
  # '♦', '♣', '♠', '♥'

  let(:hand) { Hand.new(["10♦", "J♥"]) }
  # You can add more sample hands

  describe "#calculate_hand" do
    it "returns the expected cards" do
      expect(hand.cards).to eq(["10♦", "J♥"])
    end

    it "adds up to 20" do
      expect(hand.calculate_hand).to eq(20)
    end

    it "counts Ace as one point when the total score is greater than 10" do
      expect(Hand.new(["A♦", "J♥", "3♣"]).calculate_hand).to eq(14)
    end

    it "returns 21 and counts Ace as eleven points when the total score is equal to 10" do
      expect(Hand.new(["A♦", "J♥"]).calculate_hand).to eq(21)
    end

    it "counts Ace as eleven points when the total score is equal to or less than 10" do
      expect(Hand.new(["A♦", "5♥", "2♣"]).calculate_hand).to eq(18)
    end

  end
end
# require 'pry'
# binding.pry
