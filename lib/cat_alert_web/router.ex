defmodule CatAlertWeb.Router do
  use CatAlertWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CatAlertWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/heartbeat", PageController, :heartbeat
  end

end
