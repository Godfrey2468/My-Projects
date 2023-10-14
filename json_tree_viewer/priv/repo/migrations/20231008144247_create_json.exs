defmodule JsonTreeViewer.Repo.Migrations.CreateJson do
  use Ecto.Migration

  def change do
    create table(:json) do
      add :jsons, :string
      add :jsondata, :string

      timestamps()
    end
  end
end
