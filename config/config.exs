# Since configuration is shared in umbrella projects, this file
# should only configure the :api application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :hello_world,
  ecto_repos: [HelloWorld.Repo]

config :hello_world, HelloWorld.Repo,
  username: "postgres",
  password: "postgres",
  database: "eventstore_readstore_dev",
  hostname: "localhost"

config :hello_world, event_stores: [HelloWorld.EventStore]

config :hello_world, HelloWorld.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "eventstore_dev",
  hostname: "localhost",
  pool_size: 10
