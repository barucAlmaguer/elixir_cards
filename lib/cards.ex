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

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # {status, bin_data}
    case File.read(filename) do
      {:ok, bin_data} -> :erlang.binary_to_term(bin_data)
      {:error, _reason} -> "That file does not exist"
    end
  end
end
