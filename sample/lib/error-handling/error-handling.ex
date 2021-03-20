defmodule SampleError do
  defexception message: "Custom error occured"
end

defmodule ErrorHandling do
  @moduledoc """
    displays how to error handle in Elixir
  """

  @doc """
    shows how error is thrown and caught
  """
  def handleError do
    try do
      # raise "Oh, hell...an error occured!!"
      raise SampleError
    rescue
      e in RuntimeError -> IO.puts("Error Happened: " <> e.message)
      e in SampleError -> IO.puts(to_string(e.message))
    after
      IO.puts("The end..")
    end
  end
end
