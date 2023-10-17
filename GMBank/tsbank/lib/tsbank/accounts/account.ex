defmodule Tsbank.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "accounts" do
    field :accountNumber, :string
    field :branchCode, :string
    field :interestRate, :float
    field :lastTransactionDate, :date
    field :overdraftLimit, :integer
    field :status, :string
    field :type, :string
    field :balance, :float
    #field :customer_id, :id
    belongs_to :customer, Tsbank.Customers.Customer
    has_many :transaction, Tsbank.Transactions.Transaction

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:customer_id, :accountNumber, :status, :interestRate, :overdraftLimit, :branchCode, :type, :lastTransactionDate, :balance])
    |> validate_required([:customer_id, :accountNumber, :status, :interestRate, :overdraftLimit, :branchCode, :type, :lastTransactionDate])
    |> unique_constraint(:accountNumber)
  end
end
