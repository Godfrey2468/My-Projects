defmodule ProductAlpha.Repo.Migrations.CreatePolicystates do
  use Ecto.Migration

  def change do
    create table(:policystates, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :datab, :map
      add :product_id, references(:products, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:policystates, [:product_id])
  end
end
