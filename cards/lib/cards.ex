defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    deck = for suit <- suits, value <- values do
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
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    IO.inspect  binary
    File.write(filename, binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)

    case status do
       :ok -> :erlang.binary_to_term binary
       :error -> "File does not exist!!!"
    end
  end
end
