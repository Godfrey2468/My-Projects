defmodule ProductAlpha.Repo.Migrations.CreateResources do
  use Ecto.Migration

  def change do
    create table(:resources,primary_key: false) do
      add :id, :uuid, primary_key: true
      add :datab, :map
      add :product_id, references(:products, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:resources, [:product_id])
  end
end
