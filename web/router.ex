defmodule Elixirmixpanel.Router do
  use Elixirmixpanel.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug Openmaize.LoginoutCheck
    plug Openmaize.Authenticate
  end

  pipeline :authorize do
    plug Openmaize.Authorize
    plug Openmaize.IdCheck
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Elixirmixpanel do
    pipe_through :browser
    get "/", EventController, :index, as: :root
  end

  scope "/api", Elixirmixpanel do
    pipe_through :api

    resources "/events", EventController
    resources "/users", UserController
  end

  scope "/admin", Elixirmixpanel do
    pipe_through [:browser, :authorize]

    get "/", AdminController, :index
    get "/login", AdminController, :login, as: :login
    post "/login", AdminController, :login_user, as: :login
    get "/logout", AdminController, :logout, as: :logout
  end

  scope "/admin", Elixirmixpanel do
    pipe_through :browser
    resources "/users", AdminController, only: [:new, :create, :delete]
  end
end
