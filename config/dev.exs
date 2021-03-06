use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :elixirmixpanel, Elixirmixpanel.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  cache_static_lookup: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch"]]

# Watch static and templates for browser reloading.
config :elixirmixpanel, Elixirmixpanel.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Configure your database
config :elixirmixpanel, Elixirmixpanel.Repo,
  adapter: Ecto.Adapters.Postgres,
  # username: "postgres",
  # password: "postgres",
  database: "elixirmixpanel_dev",
  size: 10 # The amount of database connections in the pool

# Openmaize authentication library configuration
config :openmaize,
  user_model: Elixirmixpanel.Admin,
  repo: Elixirmixpanel.Repo,
  crypto: :bcrypt,
  login_dir: "/admin",
  redirect_pages: %{"admin" => "/admin", nil => "/"},
  protected: %{"/admin" => ["admin"]},
  secret_key: "youwillneverguess",
  token_info: [:email],
  token_validity: 600
