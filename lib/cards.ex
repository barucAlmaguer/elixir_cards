defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    # List comprehension of the cards
    for suit <- suits,
        value <- values do
      # this is called string interpolation
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    # card in deck # also valid sintax
    Enum.member?(deck, card)
  end

  # use like this:
  # {hand, new_deck} = Cards.deal(deck, hand_size)
  # This is called pattern matching
  def deal(deck, hand_size) do
    deck = Cards.shuffle(deck)
    Enum.split(deck, hand_size)
  end
end
