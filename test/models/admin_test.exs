defmodule Elixirmixpanel.AdminTest do
  use Elixirmixpanel.ModelCase

  alias Elixirmixpanel.Admin

  @valid_attrs %{name: "some content", role: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Admin.changeset(%Admin{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Admin.changeset(%Admin{}, @invalid_attrs)
    refute changeset.valid?
  end
end
