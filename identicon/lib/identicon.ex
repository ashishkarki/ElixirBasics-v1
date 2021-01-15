defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def main(input_str) do
    # 1. first get a MD5 Hash
    input_str
    |> hash_input
    |> pick_color
  end

  # image is list of numbers, stored as Identicon.Image struct
  def pick_color(image) do
    %Identicon.Image{hex: hex_list} = image
    # pick only the first 3 values
    [r, g, b | _tail] = hex_list

    # update image Identicon.Image struct with "color" property
    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input_str) do
    # gives a binary string of numbers
    hex =
      :crypto.hash(:md5, input_str)
      # converts that to a list of hexadecimal numbers ranging between 0 and 255
      |> :binary.bin_to_list()

    %Identicon.Image{hex: hex}
  end
end
