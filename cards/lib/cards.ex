defmodule Cards do
  @moduledoc """
    Provides various methods to create and manipulate cards
  """

  @doc """
  creates a new deck

  ## Examples

      iex> _deck = Cards.create_deck()

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    deck =
      for suit <- suits, value <- values do
        "#{value} of #{suit}"
      end

    List.flatten(deck)
  end

  @doc """
    shuffles a card
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    determine if a deck contains a given card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides into deck

  ## Examples

      iex > deck = Cards.create_deck
      iex > {hand, deck} = Cards.deal(deck, 1)
      iex > hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  saves a given deck

  ## Examples

      iex> Cards.save([], "my_deck")
      <<131, 106>>
      :ok
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    IO.inspect(binary)
    File.write(filename, binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "File does not exist!!!"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
