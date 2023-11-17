defmodule ChildApp1Test do
  use ExUnit.Case
  doctest ChildApp1

  test "greets the world" do
    assert ChildApp1.hello() == :world
  end
end
