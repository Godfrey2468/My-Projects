defmodule Greet do
  def start do
    spawn(fn -> loop() end)
  end

  def loop do
    receive do
      {:greet, "morning", name} ->
        IO.puts("Good morning, #{name}!")
        loop()

      {:greet, "evening", name} ->
        IO.puts("Good evening, #{name}!")
        loop()

      {:greet, _, name} ->
        IO.puts("Hello, #{name}!")
        loop()
    end
  end
end

pid = Greet.start()

send pid, {:greet, "morning", "Sipho"}
send pid, {:greet, "evening", "Hata"}
send pid, {:greet, "Godfrey"}
