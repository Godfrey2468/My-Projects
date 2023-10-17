defmodule Tsbank.AccountsTest do
  use ExUnit.Case
  alias Tsbank.Accounts
  alias Tsbank.Accounts.Account

  # Set up a test database and other necessary configurations here

  test "list_accounts/0 returns a list of accounts" do
    # Insert test accounts into the database

    # Call the function
    accounts = Accounts.list_accounts()

    # Assertions
    assert length(accounts) > 0
    assert is_list(accounts)
    assert hd(accounts) == %Account{}
  end

  test "get_account!/1 raises an error when account does not exist" do
    # Call the function with an invalid account ID
    assert {:error, %Ecto.NoResultsError{}} = Accounts.get_account!(999)
  end

  test "get_single_account/1 returns a single account with associated customer" do
    # Insert test data into the database

    # Call the function
    account = Accounts.get_single_account(1) # Assuming 1 is a valid account ID

    # Assertions
    assert is_map(account)
    assert Map.has_key?(account, :customer)
  end

  test "get_account_by_number/1 returns an account with a specific account number" do
    # Insert test data into the database

    # Call the function
    account = Accounts.get_account_by_number("12345") # Assuming "12345" is a valid account number

    # Assertions
    assert is_map(account)
    assert account.accountNumber == "12345"
  end

  # Add similar tests for other functions like create_account, get_customer_accounts, etc.

  # Clean up the test database after each test
  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(MyApp.Repo)
    on_exit(fn -> :ok = Ecto.Adapters.SQL.Sandbox.checkin(MyApp.Repo) end)
    :ok
  end
end
