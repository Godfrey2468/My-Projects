defmodule Tsbank.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :firstName, :string
      add :lastName, :string
      add :phoneNumber, :string
      add :dateOfBirth, :date
      add :idNumber, :string
      add :passportNumber, :string
      add :ficaComplete, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:customers, [:user_id])
  end
end
