defmodule ProductAlpha.Repo.Migrations.CreatePolicies do
  use Ecto.Migration

  def change do
    create table(:policies) do
      add :data, :map
     # has_many :serviceprovider, ProductAlpha.Serviceprovider.Serviceproviders

      timestamps()
    end
  end
end
