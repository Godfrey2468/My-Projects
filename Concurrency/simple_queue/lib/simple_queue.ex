defmodule SimpleQueue do
  # ... (previous code)

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def add(pid, item) do
    GenServer.call(pid, {:add, item})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  def handle_call({:add, item}, _from, queue) do
    new_queue = [item | queue]
    {:reply, :ok, new_queue}
  end

  def handle_call(:pop, _from, [item | rest]) do
    {:reply, {item, rest}, rest}
  end
end




#defmodule SimpleQueue do

  #@queue []

 # def add(item, queue \\ @queue) do
  #  [item | queue]
  #end

  #def pop([item | rest]) do
   # {item, rest}
  #end
#end
