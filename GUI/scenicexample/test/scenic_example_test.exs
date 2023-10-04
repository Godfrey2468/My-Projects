defmodule ScenicExampleTest do
  use ExUnit.Case
  doctest ScenicExample

  test "greets the world" do
    assert ScenicExample.hello() == :world
  end
end
