defmodule Elixirmixpanel.AdminController do
  use Elixirmixpanel.Web, :controller

  alias Elixirmixpanel.Admin
  alias Openmaize.Signup

  plug :scrub_params, "admin" when action in [:create]

  def index(conn, _params) do
    admins = Repo.all(Admin)
    render(conn, "index.html", admins: admins)
  end

  def login(conn, _params) do
    render conn, "login.html"
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"admin" => admin_params}) do
    create_new(conn, Signup.create_user(admin_params))
  end

  def create_new(conn, {:ok, admin_params}) do
    changeset = Admin.changeset(%Admin{}, admin_params)
    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Admin created successfully.")
      |> redirect(to: admin_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def create_new(conn, {:error, message}) do
    conn
    |> put_flash(:error, message)
    |> redirect(to: admin_path(conn, :new))
  end

  def delete(conn, %{"id" => id}) do
    admin = Repo.get(Admin, id)
    Repo.delete(admin)

    conn
    |> put_flash(:info, "Admin deleted successfully.")
    |> redirect(to: admin_path(conn, :index))
  end
end
