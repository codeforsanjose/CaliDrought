defmodule Calidrought.Router do
  use Calidrought.Web, :router

  pipeline :api do
    plug :accepts, ["json-api"]
  end

  scope "/api", Calidrought do
    pipe_through :api
  end
end
