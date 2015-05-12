defmodule Elixirmixpanel.PageController do
  use Elixirmixpanel.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
