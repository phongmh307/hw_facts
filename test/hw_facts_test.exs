defmodule HWFactsTest do
  use ExUnit.Case
  doctest HWFacts

  test "greets the world" do
    assert HWFacts.hello() == :world
  end
end
