defmodule WorkerA do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, 0)
  end

  def init(initial_value) do
    {:ok, initial_value}
  end

  def increment do
    GenServer.call(__MODULE__, :increment)
  end

  def handle_call(:increment, _from, state) do
    {:reply, state + 1, state + 1}
  end
end
