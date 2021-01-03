# use multiple generators, much like nested loops
# listy = [1, 2, 3, 4, 5]
#
# for n <- listy, times <- 1..n  do
#   IO.puts String.duplicate("*", times)
#   IO.puts "n: #{n} - times: #{times}"
# end

# Filters example
import Integer
for x <- 1..10, is_even(x), is_number(x), do: IO.puts x

# Using :into, let’s create a map from a keyword list:
mappy = [one: 1, two: 2, three: 3]
for {k, v} <- mappy, into: %{}  do
  {k, v}
end

# Since binaries are collectables we can use list comprehensions and :into to create strings:
c = "some hello"
for c1 <- [72, 101, 108, 108, 111], into: "", do: <<c1>>
IO.puts c
