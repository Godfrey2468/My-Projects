defmodule WorkerSupervisor do
  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    children = [
      {WorkerA, []},
      {WorkerB, []}
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end
end
