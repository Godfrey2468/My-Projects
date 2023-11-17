defmodule ProductAlpha.Repo.Migrations.CreateDatamaps do
  use Ecto.Migration

  def change do
    create table(:datamaps, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :datab, :map
      add :product_id, references(:products, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:datamaps, [:product_id])
  end
end
