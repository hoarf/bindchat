# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :bindchat,
  namespace: BC,
  ecto_repos: [BC.Repo],
  generators: [binary_id: true]

config :bindchat, BC.Repo,
  password: "bindchat",
  username: "postgres",
  hostname: "localhost",
  database: "bindchat"

# Configures the endpoint
config :bindchat, BCWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: BCWeb.ErrorHTML, json: BCWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: BC.PubSub,
  live_view: [signing_salt: "Y1IsRKQ+"]

config :bindchat, ash_apis: [BC.Chat]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.3.2",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
         ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures Ash
config :bindchat, :ash_apis, [BC.Chat]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
