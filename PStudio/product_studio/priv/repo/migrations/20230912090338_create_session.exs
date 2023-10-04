defmodule ProductStudio.Repo.Migrations.CreateSession do
  use Ecto.Migration

  def change do
    create table(:session) do
      add :new, :string

      timestamps()
    end
  end
end
