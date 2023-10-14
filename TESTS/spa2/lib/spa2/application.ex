defmodule Spa2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Spa2Web.Telemetry,
      # Start the Ecto repository
      Spa2.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Spa2.PubSub},
      # Start Finch
      {Finch, name: Spa2.Finch},
      # Start the Endpoint (http/https)
      Spa2Web.Endpoint
      # Start a worker by calling: Spa2.Worker.start_link(arg)
      # {Spa2.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Spa2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Spa2Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
