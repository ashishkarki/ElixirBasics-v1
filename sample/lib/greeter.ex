defmodule Greeter do
  @moduledoc """
    Provides a function `hello/1` to greet its invoker
  """

  @doc """
    Prints a hello message

    ## Parameters
      - name: name of the person to output to the console
  """
  @spec hello(String.t()) :: String.t()
  def hello(name) do
    "Hello, " <> name
  end
end
