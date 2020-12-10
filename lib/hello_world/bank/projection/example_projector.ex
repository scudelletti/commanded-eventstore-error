defmodule ExampleProjector do
  use Commanded.Projections.Ecto,
    application: HelloWorld.App,
    repo: HelloWorld.Repo,
    name: "example_projection"
end

o
