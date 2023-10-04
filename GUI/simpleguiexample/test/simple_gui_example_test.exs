defmodule SimpleGuiExampleTest do
  use ExUnit.Case
  doctest SimpleGuiExample

  test "greets the world" do
    assert SimpleGuiExample.hello() == :world
  end
end
