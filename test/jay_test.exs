defmodule JayTest do
  use ExUnit.Case
  doctest Jay

  test "greets the world" do
    assert Jay.hello() == :world
  end
end
