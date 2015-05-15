defmodule Elixirmixpanel.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :user_id, references(:users)
      timestamps
    end

  end
end
