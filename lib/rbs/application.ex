defmodule RBS.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {
        Orbit.Capsule,
        endpoint: RBSGem.Router,
        certfile: Path.join(Application.app_dir(:rbs, "priv"), "cert.pem"),
        keyfile: Path.join(Application.app_dir(:rbs, "priv"), "key.pem")
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RBS.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
