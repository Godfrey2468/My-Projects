defmodule ProductAlpha.Repo.Migrations.CreateThresholdss do
  use Ecto.Migration

  def change do
    create table(:thresholdss, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :datab, :map
      add :product_id, references(:products, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:thresholdss, [:product_id])
  end
end
