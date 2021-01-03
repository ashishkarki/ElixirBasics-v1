defmodule Test do
  def hello do
    IO.puts "Hello from test"

    s = ~s/welcome to elixir #{String.downcase("SCHOOL")} with interpolation/
    IO.puts(s)

    dt = DateTime.from_iso8601("2015-01-23 23:50:07Z") == {:ok, ~U[2015-01-23 23:50:07Z], 0}
    dt1 = DateTime.from_iso8601("2015-01-23 23:50:07-0600") == {:ok, ~U[2015-01-24 05:50:07Z], -21600}
    IO.puts(dt)
    IO.puts(dt1)
  end
end

Test.hello
