defmodule ChirpWeb.Router do
  use ChirpWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ChirpWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
