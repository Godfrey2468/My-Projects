defmodule Greet do
  def start do
    spawn(fn -> loop() end)
  end

  def loop do
    receive do
      {:greet, name} ->
        IO.puts("Hello, #{name}!")
        loop()
    end
  end
end
