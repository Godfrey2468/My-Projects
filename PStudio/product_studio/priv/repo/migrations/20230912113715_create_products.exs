defmodule ProductStudio.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string
      add :price, :decimal
      add :description, :text
      add :stock, :integer

      timestamps()
    end
  end
end
