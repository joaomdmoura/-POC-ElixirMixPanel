defmodule Elixirmixpanel.Repo.Migrations.CreateAdmin do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :name, :string
      add :email, :string
      add :password_hash, :string
      add :role, :string

      timestamps
    end

  end
end
