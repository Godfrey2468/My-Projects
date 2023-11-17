defmodule ProductAlpha.Repo.Migrations.CreateIntialservices do
  use Ecto.Migration

  def change do
    create table(:intialservices, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :datab, :map
      add :product_id, references(:products, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:intialservices, [:product_id])
  end
end
