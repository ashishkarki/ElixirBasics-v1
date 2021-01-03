defmodule MetaprogramBasic do
  def runner() do
    denominator = 2

    "#{
      quote do
        div(42, denominator)
      end
    }"

    "#{quote do: div(42, unquote(denominator))}"
  end
end
