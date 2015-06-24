defmodule Elixirmixpanel.User do
  use Elixirmixpanel.Web, :model

  schema "users" do
    field :identifier, :string
    field :data, :string
    has_many :events, Elixirmixpanel.Event

    timestamps
  end

  @required_fields ~w(identifier)
  @optional_fields ~w(data)

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
