defmodule Elixirmixpanel.EventController do
  use Elixirmixpanel.Web, :controller

  alias Elixirmixpanel.Event
  alias Elixirmixpanel.User

  plug :scrub_params, "event" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    events = Event |> Repo.all |> Repo.preload [:user]
    render(conn, :index, events: events)
  end

  def create(conn, %{"event" => event_params}) do
    user = Repo.get(User, event_params["user"]["identifier"])

    if !user do
      changeset = User.changeset(%User{}, event_params["user"])
      user = Repo.insert(changeset)
    end

    changeset = build(user, :events) |> Event.changeset(event_params)

    if changeset.valid? do
      event = Repo.insert(changeset)
      render(conn, "show.json", event: event)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Elixirmixpanel.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event = Repo.get(Event, id)
    render conn, "show.json", event: event
  end

  def delete(conn, %{"id" => id}) do
    event = Repo.get(Event, id)

    event = Repo.delete(event)
    render(conn, "show.json", event: event)
  end
end
