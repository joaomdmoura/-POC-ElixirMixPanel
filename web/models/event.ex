defmodule Elixirmixpanel.Event do
  use Elixirmixpanel.Web, :model

  schema "events" do
    field :name, :string
    belongs_to :user, Elixirmixpanel.User

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
