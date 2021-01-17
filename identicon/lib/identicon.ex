defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """
  Main function to create our identicon from an input string

  ## Examples

      iex> Identicon.main("Asdf")
      :ok

    Now, find a file named "Asdf.png" at the root of your project
  """
  def main(input_str) do
    # 1. first get a MD5 Hash
    input_str
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_out_odd_squares
    |> build_pixel_map
    |> draw_image
    |> save_image(input_str)
  end

  def save_image(image_file, input_str) do
    File.write("#{input_str}.png", image_file)
  end

  def draw_image(%Identicon.Image{color: color, pixel_map: pixel_map}) do
    image = :egd.create(250, 250) # empty pixel map at this point using erlang
    fill = :egd.color(color)

    Enum.each(pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill)
    end)

    :egd.render(image)
  end

  def build_pixel_map(%Identicon.Image{grid: grid} = image_struct) do
    pixel_map = Enum.map grid, fn({_value, index}) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50

      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 50, vertical + 50}

      {top_left, bottom_right}
    end

    %Identicon.Image{image_struct | pixel_map: pixel_map}
  end

  def filter_out_odd_squares(%Identicon.Image{grid: grid} = image_struct) do
    filtered_grid =
      Enum.filter(grid, fn {value, _index} ->
        rem(value, 2) == 0
      end)

    %Identicon.Image{image_struct | grid: filtered_grid}
  end

  @doc """
    Builds a grid of colors to display as Identicon

    - Parameters:
    the hexadecimal representation of grid colors from our image_struct
  """
  def build_grid(%Identicon.Image{hex: hex} = image_struct) do
    grid =
      hex
      |> Enum.chunk(3)
      # pass a reference
      |> Enum.map(&mirror_row/1)
      # takes our nested list and makes it one list
      |> List.flatten()
      # convert the list into a {element, index} tuples
      |> Enum.with_index()

    %Identicon.Image{image_struct | grid: grid}
  end

  def mirror_row(row) do
    # row will be [146, 45, 100] at the start
    # and [146, 45, 100, 45, 146] at the end
    [first, second | _tail] = row

    row ++ [second, first]
  end

  # image is list of numbers, stored as Identicon.Image struct
  # recieve image as our argument and pattern match to get whatever we want
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image_struct) do
    # %Identicon.Image{hex: hex_list} = image
    # # pick only the first 3 values
    # [r, g, b | _tail] = hex_list

    # %Identicon.Image{hex: [r, g, b | _tail]} = image

    # update image (Identicon.Image) struct with "color" property
    %Identicon.Image{image_struct | color: {r, g, b}}
  end

  @doc """
    Returns an image struct representation of the hashed value of input_str
  """
  def hash_input(input_str) do
    # gives a binary string of numbers
    hex =
      :crypto.hash(:md5, input_str)
      # converts that to a list of hexadecimal numbers ranging between 0 and 255
      |> :binary.bin_to_list()

    %Identicon.Image{hex: hex}
  end
end
