defmodule MyWorker do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def increment do
    GenServer.call(__MODULE__, :increment)
  end

  def handle_call(:increment, _from, state) do
    {:reply, :ok, state + 1}
  end
end

defmodule MySupervisor do
  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    children = [
      {MyWorker, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
