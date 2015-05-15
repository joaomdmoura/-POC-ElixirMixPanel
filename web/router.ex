defmodule Elixirmixpanel.Router do
  use Elixirmixpanel.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", Elixirmixpanel do
  #   pipe_through :browser
  #   get "/", PageController, :index
  # end

  scope "/api", Elixirmixpanel do
    pipe_through :api

    resources "/events", EventController, only: [:index, :show, :create, :delete]
    resources "/users", UserController, only: [:index, :show, :update, :delete]
  end
end
