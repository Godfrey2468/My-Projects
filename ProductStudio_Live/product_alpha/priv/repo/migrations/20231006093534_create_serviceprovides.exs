defmodule ProductAlpha.Repo.Migrations.CreateServiceprovides do
  use Ecto.Migration

  def change do
    create table(:serviceprovides, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :datab, :map
      add :product_id, references(:products, on_delete: :nothing,  type: :uuid)

      timestamps()
    end

    create index(:serviceprovides, [:product_id])
  end
end
