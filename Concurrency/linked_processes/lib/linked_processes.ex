 defmodule LinkedProcess do
   def start_link do
     spawn_link(fn -> loop() end)
   end

   def loop do
     receive do
       :exit -> exit(:normal)
       msg -> IO.puts("Received: #{msg}")
         loop()
     end
    end
   def send_message(pid, msg) do
    send(pid, msg)
  end
 end
