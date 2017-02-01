defmodule Crawl do
  def fetch_search_results(search_results) do
    HTTPoison.get!(search_results).body
  end

  def follow_link(uri) do
    base = "http://cdec.water.ca.gov"
    HTTPoison.get!(base <> uri).body
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
