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
    :queue.from_list(urls)
  end

  def parse_station_links(hydrologic_area_page) do
    hydrologic_area_page
    |> Floki.find("a")
    |> Floki.attribute("href")
    |> Enum.filter(&(String.contains?(&1, "station_id")))
  end

  def hydrologic_area_links do
    search_url = "http://cdec.water.ca.gov/cgi-progs/staSearch?hydro_chk=on&display=sta&hydro="

    hydrologic_areas = [
      :central_coast,
      :colorado_river,
      :north_coast,
      :north_lahontan,
      :sacramento_river,
      :san_francisco_bay,
      :san_joaquin_river,
      :south_coast,
      :south_lahontan,
      :tulare_lake
    ]

    hydrologic_areas
    |> Enum.map(&(Atom.to_string(&1)))
    |> Enum.map(&(String.upcase(&1)))
    |> Enum.map(&(String.replace(&1, "_", "+")))
    |> Enum.map(&(search_url <> &1))
  end
end
