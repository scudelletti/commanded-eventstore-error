defmodule HelloWorld.Link do
  use GenServer

  require Logger

  def start_link(options \\ [name: {:global, __MODULE__}]) do
    GenServer.start_link(__MODULE__, :ok, options)
  end

  @impl true
  def init(_) do
    {:ok, nil, {:continue, :initialize}}
  end

  @impl true
  def handle_continue(:initialize, _state) do
    Process.sleep(5_000)

    state =
      case HelloWorld.BabySitter.start_link() do
        {:ok, pid} ->
          {:local, pid}

        {:error, {:already_started, pid}} ->
          true = Process.link(pid)
          {:remote, pid}
      end

    {:noreply, state}
  end
end
