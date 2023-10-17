defmodule Tsbank.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :accountNumber, :string
      add :status, :string
      add :interestRate, :float
      add :overdraftLimit, :integer
      add :branchCode, :string
      add :type, :string
      add :lastTransactionDate, :date
      add :balance, :float
      add :customer_id, references(:customers, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create unique_index(:accounts, [:customer_id, :accountNumber])
  end
end
