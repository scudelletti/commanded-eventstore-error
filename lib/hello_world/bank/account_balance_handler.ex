defmodule AccountBalanceHandler do
  use Commanded.Event.Handler,
    application: HelloWorld.App,
    name: __MODULE__

  def init do
    with {:ok, _pid} <- Agent.start_link(fn -> 0 end, name: __MODULE__) do
      :ok
    end
  end

  def handle(%BankAccountOpened{account_number: acc_number, initial_balance: balance}, _metadata) do
    projection = %ExampleProjection{account_number: acc_number, balance: balance}

    HelloWorld.Repo.insert(projection)
  end

  def handle(%Deposited{account_number: acc_number, value: value}, _metadata) do
    projection = HelloWorld.Repo.get_by(ExampleProjection, account_number: acc_number)
    new_balance = projection.balance + value
    new_projection = ExampleProjection.update_balance(projection, %{balance: new_balance})

    HelloWorld.Repo.update(new_projection)
  end
end
