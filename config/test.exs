use Mix.Config

config :cat_alert, api_service: CatAlert.FakeAPIConnection

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cat_alert, CatAlertWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :cat_alert, CatAlert.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "cat_alert_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
