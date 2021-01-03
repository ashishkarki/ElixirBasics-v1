# Internally, Elixir strings are represented with a sequence of bytes
# rather than an array of characters. Elixir also has a char list type (character list).
# Elixir strings are enclosed with double quotes, while char lists are enclosed
# with single quotes.

# anagrams example
defmodule Anagram do
  @moduledoc """
    A and B are considered anagrams if there’s a way to rearrange A or B making them equal.
    Provids a function `anagrams?/2`
  """

  @doc """
   checks to see if two strings are anagrams
   ## Parameters
   - a: first string
   - b: second string
  """
  def anagrams?(a, b) when is_binary(a) and is_binary(b) do
    sort_string(a) == sort_string(b)
  end

@doc """
  sorts the graphemes/characters in a given string
  ## Parameters
  - str: the string to sort
  ## Examples
  - sort_string("acb") => "abc"
"""
  def sort_string(str) do
    str
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end

end

Anagram.anagrams?("Hello", "hello")
