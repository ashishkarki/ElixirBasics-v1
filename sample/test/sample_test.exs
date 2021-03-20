defmodule SampleTest do
  use ExUnit.Case
  doctest Sample

  setup_all do
    {:ok, recipient: :world}
  end

  test "greets the world" do
    assert Sample.hello() == :world
  end

  test "greets", state do
    assert Sample.hello() == state[:recipient]
  end
end
