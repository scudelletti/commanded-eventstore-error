defmodule AccountBalanceHandler do
  use Commanded.Event.Handler,
    application: HelloWorld.App,
    name: __MODULE__

  def init do
    IO.inspect(label: "======================> #{__MODULE__}.init")

    with {:ok, _pid} <- Agent.start_link(fn -> 0 end, name: __MODULE__) do
      :ok
    end
  end

  def handle(%BankAccountOpened{initial_balance: initial_balance}, _metadata) do
    IO.inspect(label: "======================> #{__MODULE__}.handle")
    Agent.update(__MODULE__, fn _ -> initial_balance end)
  end

  def current_balance do
    IO.inspect(label: "======================> #{__MODULE__}.current_balance")
    Agent.get(__MODULE__, fn balance -> balance end)
  end
end
