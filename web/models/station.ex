defmodule Calidrought.Station do
  use Calidrought.Web, :model

  schema "stations" do
    field :station_id,      :string
    field :url,             :string
    field :elevation,       :float
    field :river_basin,     :string
    field :county,          :string
    field :hydrologic_area, :string
    field :nearby_city,     :string
    field :operator,        :string
    field :point,           Geo.Point

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:station_id, :url, :elevation, :river_basin, :county, :hydrologic_area, :nearby_city, :operator, :point])
    |> validate_required([:station_id, :url, :elevation, :river_basin, :county, :hydrologic_area, :nearby_city, :operator, :point])
  end
end
