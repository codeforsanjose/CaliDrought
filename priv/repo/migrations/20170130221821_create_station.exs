defmodule Calidrought.Repo.Migrations.CreateStation do
  use Ecto.Migration

  def change do
    create table(:stations) do
      add :station_id, :string
      add :url, :string
      add :elevation, :float
      add :river_basin, :string
      add :county, :string
      add :hydrologic_area, :string
      add :nearby_city, :string
      add :operator, :string
      add :point, :point

      timestamps()
    end

  end
end
