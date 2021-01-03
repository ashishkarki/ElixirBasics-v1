defmodule Sample.CLI do
  @moduledoc """
    Defines the file that contains a `main/1` function that serves
    as an entry point to our executable
  """

  def main(args \\ []) do
    # parsing our args
    args
    |> parse_args()
    |> response()
    |> IO.puts()
  end

  defp parse_args(args) do
    {opts, word, _} =
      args
      |> OptionParser.parse(switches: [upcase: :boolean])

      {opts, List.to_string(word)}
  end

  defp response({opts, word}) do
    if opts[:upcase], do: String.upcase(word), else: word
  end
end
