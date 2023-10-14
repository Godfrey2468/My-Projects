defmodule Tsbank.AccountsTest do
  use Tsbank.DataCase

  alias Tsbank.Accounts

  describe "accounts" do
    alias Tsbank.Accounts.Account

    import Tsbank.AccountsFixtures

    @invalid_attrs %{accountNumber: nil, branchCode: nil, interestRate: nil, lastTransactionDate: nil, overdraftLimit: nil, status: nil, type: nil}

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Accounts.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Accounts.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      valid_attrs = %{accountNumber: "some accountNumber", branchCode: "some branchCode", interestRate: 120.5, lastTransactionDate: ~D[2023-08-29], overdraftLimit: 42, status: "some status", type: "some type"}

      assert {:ok, %Account{} = account} = Accounts.create_account(valid_attrs)
      assert account.accountNumber == "some accountNumber"
      assert account.branchCode == "some branchCode"
      assert account.interestRate == 120.5
      assert account.lastTransactionDate == ~D[2023-08-29]
      assert account.overdraftLimit == 42
      assert account.status == "some status"
      assert account.type == "some type"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      update_attrs = %{accountNumber: "some updated accountNumber", branchCode: "some updated branchCode", interestRate: 456.7, lastTransactionDate: ~D[2023-08-30], overdraftLimit: 43, status: "some updated status", type: "some updated type"}

      assert {:ok, %Account{} = account} = Accounts.update_account(account, update_attrs)
      assert account.accountNumber == "some updated accountNumber"
      assert account.branchCode == "some updated branchCode"
      assert account.interestRate == 456.7
      assert account.lastTransactionDate == ~D[2023-08-30]
      assert account.overdraftLimit == 43
      assert account.status == "some updated status"
      assert account.type == "some updated type"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_account(account, @invalid_attrs)
      assert account == Accounts.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Accounts.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Accounts.change_account(account)
    end
  end
end
