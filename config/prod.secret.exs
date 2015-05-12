use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :elixirmixpanel, Elixirmixpanel.Endpoint,
  secret_key_base: "Shk+kt/MsZ9O/M5aLfHEu3anD94LnDpESe9NLMsF/ehOAo4oJminnYxazqcqnfWj"

# Configure your database
config :elixirmixpanel, Elixirmixpanel.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "elixirmixpanel_prod",
  size: 20 # The amount of database connections in the pool
