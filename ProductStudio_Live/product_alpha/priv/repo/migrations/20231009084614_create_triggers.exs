defmodule ProductAlpha.Repo.Migrations.CreateTriggers do
  use Ecto.Migration

  def change do
    create table(:triggers, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :datab, :map
      add :product_id, references(:products, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:triggers, [:product_id])
  end
end
