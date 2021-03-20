defmodule MySigils do
  def sigil_p(string, []), do: String.upcase(string)
end
