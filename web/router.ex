defmodule Calidrought.Router do
  use Calidrought.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Calidrought do
    pipe_through :api
  end
end
