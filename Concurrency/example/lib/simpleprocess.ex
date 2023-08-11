defmodule Foo do
  def receiver() do
    receive do
      v -> IO.inspect v
           receiver()
    end
  end
end
