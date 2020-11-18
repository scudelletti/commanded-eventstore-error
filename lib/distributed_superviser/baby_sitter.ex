defmodule HelloWorld.BabySitter do
  use GenServer

  require Logger

  def start_link(options \\ [name: {:global, __MODULE__}]) do
    GenServer.start_link(__MODULE__, :ok, options)
  end

  def write(filename) do
    GenServer.call({:global, __MODULE__}, {:filename, filename})
  end

  def init(_) do
    Process.flag(:trap_exit, true)
    {:ok, nil, {:continue, :initialize}}
  end

  def handle_continue(:initialize, state) do
    {:ok, _} = AccountBalanceHandler.start_link()
    {:noreply, state}
  end

  def handle_info({:EXIT, from, _reason}, state) when node(from) != node() do
    Logger.info(
      "Ignoring exit request(#{inspect(from)}) since request is from different node(#{node()})"
    )

    {:noreply, state}
  end
end
