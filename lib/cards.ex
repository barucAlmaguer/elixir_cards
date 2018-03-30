defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    # List comprehension of the cards
    cards =
      for value <- values do
        for suit <- suits do
          # this is called string interpolation
          "#{value} of #{suit}"
        end
      end

    # remove unnecesary nested lists by flattening them
    List.flatten(cards)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    # card in deck # also valid sintax
    Enum.member?(deck, card)
  end
end
