defmodule ExampleProjector do
  use Commanded.Projections.Ecto,
    application: HelloWorld.App,
    repo: HelloWorld.Repo,
    name: "example_projection"

  alias HelloWorld.Repo

  project(
    %BankAccountOpened{account_number: acc_number, initial_balance: balance},
    _metadata,
    fn multi ->
      projection = %ExampleProjection{account_number: acc_number, balance: balance}

      Ecto.Multi.insert(multi, :example_projection, projection)
    end
  )

  project(
    %Deposited{account_number: acc_number, value: value},
    _metadata,
    fn multi ->
      projection = HelloWorld.Repo.get_by(ExampleProjection, account_number: acc_number)

      new_balance = projection.balance + value
      new_projection = ExampleProjection.update_balance(projection, %{balance: new_balance})

      Ecto.Multi.update(multi, :example_projection, new_projection)
    end
  )
end
