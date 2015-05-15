defmodule Elixirmixpanel.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :identifier, :string
      add :data, :text

      timestamps
    end

  end
end
