defmodule Calidrought.StationTest do
  use Calidrought.ModelCase

  alias Calidrought.Station

  @valid_attrs %{county: "some content", elevation: "120.5", hydrologic_area: "some content", nearby_city: "some content", operator: "some content", river_basin: "some content", station_id: "some content", url: "some content", point: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Station.changeset(%Station{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Station.changeset(%Station{}, @invalid_attrs)
    refute changeset.valid?
  end
end
