defmodule SupportSystem.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [

      SupportSystem.TicketSupervisor
      # Starts a worker by calling: SupportSystem.Worker.start_link(arg)
      # {SupportSystem.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SupportSystem.Supervisor]
    Supervisor.start_link(children, opts)
  end
end