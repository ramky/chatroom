# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chatroom,
  ecto_repos: [Chatroom.Repo]

# Configures the endpoint
config :chatroom, Chatroom.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5M00vucwU4q6dVckNZfl5FZmf728fs2UspMhpI+i8JTXFQKgKByxX627Az7j+W9N",
  render_errors: [view: Chatroom.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chatroom.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
