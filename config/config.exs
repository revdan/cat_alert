# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cat_alert,
  ecto_repos: [CatAlert.Repo]

# Configures the endpoint
config :cat_alert, CatAlertWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tYjR8fspT7mavhmVx5idJTGWFehEF0RPQ8ux9dWVzFbTYq/gQXs+FdzqrCrWgmR+",
  render_errors: [view: CatAlertWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CatAlert.PubSub,
           adapter: Phoenix.PubSub.PG2],
  twitter_account: "CatAlerts"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :cat_alert, CatAlert.Mailer,
  adapter: Bamboo.SendgridAdapter,
  api_key: System.get_env("SENDGRID_API_KEY")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
