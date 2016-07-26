defmodule PhoenixTestApp.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :message, :string, null: false, default: "", size: 255
      timestamps()
    end
  end
end
