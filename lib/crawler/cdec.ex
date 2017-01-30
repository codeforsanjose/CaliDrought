defmodule Calidrought.Crawler.Cdec do
  use GenServer
  require Logger

  # Queue logic.

  def start_link do
    queue = initial_queue()
    GenServer.start_link(__MODULE__, queue)
  end

  def init(queue) do
    schedule_work()
    {:ok, queue}
  end

  defp schedule_work do
    Process.send_after(self(), :work, 1 * 1 * 100)
  end

  def handle_info(:work, queue) do
    new_queue = case :queue.out(queue) do
                  {{_value, item}, queue_2} ->
                    process(item, queue_2)
                  _ ->
                    Logger.debug "Queue is empty - restarting queue."
                    initial_queue()
                end

    schedule_work()

    {:noreply, new_queue}
  end

  def process({}, queue) do
    IO.puts "oh my goodness"
    queue
  end

  # Parsing logic.

  def initial_queue do
    IO.puts "oh my goodness"
  end
end
