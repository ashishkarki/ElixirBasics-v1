defmodule TryCatch do
  def catcherInTheTry do
    try do
      for x <- 0..10 do
        if x == 5, do: throw(x)
        IO.puts(x)
      end
    catch
      x -> IO.puts("Caught error value: #{x}")
    end
  end
end
