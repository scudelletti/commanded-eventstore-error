defmodule HelloWorld do
  @moduledoc """
  Documentation for `HelloWorld`.
  """

  def create(account_number \\ nil) do
    account_number = account_number || :rand.uniform(1_000_000)

    :ok =
      HelloWorld.App.dispatch(%OpenBankAccount{
        account_number: account_number,
        initial_balance: 1_000
      })
  end

  def deposit(value, account_number) do
    :ok =
      HelloWorld.App.dispatch(%Deposit{
        account_number: account_number,
        value: value
      })
  end

  def full(account_number \\ nil) do
    account_number = account_number || :rand.uniform(1_000_000)

    :ok =
      HelloWorld.App.dispatch(%OpenBankAccount{
        account_number: account_number,
        initial_balance: 1_000
      })

    :ok =
      HelloWorld.App.dispatch(%Deposit{
        account_number: account_number,
        value: 10
      })

    :ok =
      HelloWorld.App.dispatch(%Deposit{
        account_number: account_number,
        value: 100
      })
  end
end
