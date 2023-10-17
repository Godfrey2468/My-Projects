# TsbankWeb.AccountController

defmodule TsbankWeb.AccountController do
  @moduledoc """
  The AccountController module handles HTTP requests related to user accounts.

  It provides actions for listing, creating, viewing, updating, and deleting accounts.
  """

  use TsbankWeb, :controller

  alias Tsbank.Accounts
  alias Tsbank.Accounts.Account
  alias TsbankWeb.Auth.Guardian
  alias Tsbank.Users
  alias BankAccount
  alias BankRegistry
  # alias TsbankWeb.Customers.Customer

  action_fallback TsbankWeb.FallbackController

  @doc """
  List all user accounts.

  This action retrieves a list of all user accounts and renders them in the index view.

  ## Params

  - `conn`: The connection struct.
  - `_params`: Ignored parameters.

  """
  def index(conn, _params) do
    accounts = Accounts.list_accounts()
    render(conn, :index, accounts: accounts)
  end

  @doc """
  Create a new user account.

  This action creates a new user account based on the provided account_params.

  ## Params

  - `conn`: The connection struct.
  - `account_params`: A map containing account information.

  """
  def create(conn, %{"account" => account_params}) do
    IO.puts("Checking for some bugs")
    user_id = IO.inspect(conn.assigns.user.id)
    customer_id_on = IO.inspect(Guardian.get_me_id(user_id))
    customer_struct = IO.inspect(Users.get_customer_user(customer_id_on))

    with {:ok, %Account{} = account} <- Accounts.create_account(customer_struct, IO.inspect(account_params)) do
      conn
      |> put_status(:created)
      |> render(:show, account: IO.inspect(account))
    end
  end

  @doc """
  View a specific account.

  This action retrieves and renders information for a specific user account.

  ## Params

  - `conn`: The connection struct.
  - `account_id`: The unique identifier of the account.

  """
  def view_spec_acc(conn, %{"account_id" => account_id}) do
    account = IO.inspect(Accounts.get_single_account(account_id))
    render(conn, :showaccount, account: account)
  end

  @doc """
  Get all accounts for a specific customer.

  This action retrieves a list of all accounts associated with a specific customer.

  ## Params

  - `conn`: The connection struct.
  - `customer_id`: The unique identifier of the customer.

  """
  def all_accounts(conn, %{"customer_id" => customer_id}) do
    accounts = Accounts.get_customer_accounts(customer_id)
    render(conn, :showdiff, accounts: IO.inspect(accounts))
  end

  @doc """
  Get all accounts for the currently authenticated customer.

  This action retrieves a list of all accounts associated with the currently authenticated customer.

  ## Params

  - `conn`: The connection struct.
  - `_params`: Ignored parameters.

  """
  def all_accounts_customer(conn, _params) do
    user_id = IO.inspect(conn.assigns.user.id)
    customer_id_on = IO.inspect(Guardian.get_me_id(user_id))
    accounts = Accounts.get_customer_accounts(customer_id_on)
    render(conn, :showdiff, accounts: IO.inspect(accounts))
  end

  @doc """
  Deposit money into an account.

  This action handles depositing money into a user account.

  ## Params

  - `conn`: The connection struct.
  - `params`: Not yet defined.

  """
  def deposit_money(conn, %{}) do
    # Implement the deposit money functionality
  end

  @doc """
  Show account details.

  This action retrieves and renders details of a specific user account.

  ## Params

  - `conn`: The connection struct.
  - `id`: The unique identifier of the account.

  """
  def show(conn, %{"id" => id}) do
    account = Accounts.get_account!(id)
    render(conn, :show, account: account)
  end

  @doc """
  Update a user account.

  This action updates an existing user account with new account_params.

  ## Params

  - `conn`: The connection struct.
  - `id`: The unique identifier of the account.
  - `account_params`: A map containing updated account information.

  """
  def update(conn, %{"id" => id, "account" => account_params}) do
    account = Accounts.get_account!(id)

    with {:ok, %Account{} = account} <- Accounts.update_account(account, account_params) do
      render(conn, :show, account: account)
    end
  end

  def update_status(conn, %{"account_id" => account_id}) do
    account = IO.inspect(Accounts.get_single_account(account_id))



    if account.status == "Active" do
      with {:ok, %Account{} = account} <- Accounts.update_account(account, %{status: "Inactive"}) do
        render(conn, :show, account: account)
      end
    else
      with {:ok, %Account{} = account} <- Accounts.update_account(account,  %{status: "Active"}) do
        render(conn, :show, account: account)
      end
    end
   # Map.put(account,"status","activeee")
    #Map.put(user_params, "end_date", DateTime.utc_now)
  end

  @doc """
  Delete a user account.

  This action deletes a specific user account.

  ## Params

  - `conn`: The connection struct.
  - `id`: The unique identifier of the account.

  """
  def delete(conn, %{"id" => id}) do
    account = Accounts.get_account!(id)

    with {:ok, %Account{}} <- Accounts.delete_account(account) do
      send_resp(conn, :no_content, "")
    end
  end
end
