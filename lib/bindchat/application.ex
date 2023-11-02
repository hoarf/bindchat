defmodule BC.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BCWeb.Telemetry,
      # Start the Ecto repository
      BC.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: BC.PubSub},
      # Start the Endpoint (http/https)
      BCWeb.Endpoint
      # Start a worker by calling: BC.Worker.start_link(arg)
      # {BC.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BC.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BCWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
