defmodule ProcessExample do
  @moduledoc """
    Demonstrates eventually how to `spawn(fun)` a process
  """

  @doc """
    To evaluate the function asynchronously we use spawn/3 like so
    - `spawn(ProcessExample, :add, [2, 3])`
  """
  def add(a, b) do
    IO.puts(a + b)
  end

  @doc """
    listen/0 function is recursive, this allows our process to handle multiple messages.
    Without recursion our process would exit after handling the first message.
  """
  def listen do
    receive do
      {:ok, "hello"} -> IO.puts("World")
    end

    listen()
  end
end
