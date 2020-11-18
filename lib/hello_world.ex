defmodule HelloWorld do
  @moduledoc """
  Documentation for `HelloWorld`.
  """

  def hello do
    :ok =
      HelloWorld.App.dispatch(%OpenBankAccount{
        account_number: "#{:rand.uniform(1_000_000)}",
        initial_balance: 1_000
      })
  end
end
