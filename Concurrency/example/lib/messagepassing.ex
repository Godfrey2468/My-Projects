defmodule MessagePassing do
  def listen do
    receive do
      {:ok, "hello"} -> IO.puts("World")
    end

    listen()
    
  end
end

#MessagePassing.listen()
