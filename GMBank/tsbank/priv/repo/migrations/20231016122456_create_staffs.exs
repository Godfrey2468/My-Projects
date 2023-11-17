defmodule Tsbank.Repo.Migrations.CreateStaffs do
  use Ecto.Migration

  def change do
    create table(:staffs) do
      add :moreinfo, :string

      timestamps()
    end
  end
end
