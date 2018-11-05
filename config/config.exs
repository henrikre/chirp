# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chirp,
  ecto_repos: [Chirp.Repo]

# Configures the endpoint
config :chirp, ChirpWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WgLHjJEzcIOw7phQ99KH4yOl1PLYtW413weNbf7WvEOd+8MIUeuHwGBqG0GfnKQD",
  render_errors: [view: ChirpWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Chirp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
