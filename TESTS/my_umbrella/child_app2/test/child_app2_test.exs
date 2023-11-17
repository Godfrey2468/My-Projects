defmodule ChildApp2Test do
  use ExUnit.Case
  doctest ChildApp2

  test "greets the world" do
    assert ChildApp2.hello() == :world
  end
end
