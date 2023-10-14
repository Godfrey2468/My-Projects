defmodule JsonTransformer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      JsonTransformerWeb.Telemetry,
      # Start the Ecto repository
      JsonTransformer.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: JsonTransformer.PubSub},
      # Start Finch
      {Finch, name: JsonTransformer.Finch},
      # Start the Endpoint (http/https)
      JsonTransformerWeb.Endpoint
      # Start a worker by calling: JsonTransformer.Worker.start_link(arg)
      # {JsonTransformer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: JsonTransformer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    JsonTransformerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
