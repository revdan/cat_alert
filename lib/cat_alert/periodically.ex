defmodule CatAlert.Periodically do
  require Logger
  use GenServer
  alias CatAlert.CatAPI

  def start_link(name, timeout) do
    GenServer.start_link(__MODULE__, {name, timeout}, [name: name])
  end

  def init(state) do
    schedule_work(state)

    {:ok, state}
  end

  def handle_info(type, state) do
    spawn(fn() -> CatAPI.process_cats(type) end)

    schedule_work(state)

    {:noreply, state}
  end

  defp schedule_work({name, timeout}) do
    Process.send_after(self(), name, timeout)
  end
end
