defmodule Tsbank.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tsbank.Accounts` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        accountNumber: "some accountNumber",
        branchCode: "some branchCode",
        interestRate: 120.5,
        lastTransactionDate: ~D[2023-08-29],
        overdraftLimit: 42,
        status: "some status",
        type: "some type"
      })
      |> Tsbank.Accounts.create_account()

    account
  end
end
