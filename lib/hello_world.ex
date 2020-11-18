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

  def where_is_file do
    :global.whereis_name(HelloWorld.Link)
  end

  def where_is_baby_sitter do
    :global.whereis_name(HelloWorld.BabySitter)
  end

  def where_is_link do
    :global.whereis_name(HelloWorld.File)
  end

  def write do
    HelloWorld.File.write("#{:rand.uniform(1_000_000)}")
  end
end
