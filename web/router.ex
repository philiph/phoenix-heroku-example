defmodule PhoenixTestApp.Router do
  use PhoenixTestApp.Web, :router

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

  scope "/", PhoenixTestApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
  end

  scope "/api", PhoenixTestApp do
    pipe_through :api

    get "/", ApiHomeController, :index
    resources "/messages", MessagesController, only: [:index, :show]
  end
end
