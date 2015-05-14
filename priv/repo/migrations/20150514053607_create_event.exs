defmodule Elixirmixpanel.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string

      timestamps
    end

  end
end
