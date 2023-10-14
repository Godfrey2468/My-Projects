defmodule JsonTreeViewer.Repo.Migrations.CreateJsons do
  use Ecto.Migration

  def change do
    create table(:jsons) do

      timestamps()
    end
  end
end
