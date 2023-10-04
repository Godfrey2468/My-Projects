defmodule MockOne.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MockOneWeb.Telemetry,
      # Start the Ecto repository
      MockOne.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: MockOne.PubSub},
      # Start Finch
      {Finch, name: MockOne.Finch},
      # Start the Endpoint (http/https)
      MockOneWeb.Endpoint
      # Start a worker by calling: MockOne.Worker.start_link(arg)
      # {MockOne.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MockOne.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MockOneWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
