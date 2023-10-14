defmodule TsbankWeb.AccountController do
  use TsbankWeb, :controller

  alias Tsbank.Accounts
  alias Tsbank.Accounts.Account

  alias TsbankWeb.Auth.Guardian

  alias Tsbank.Users

  alias BankAccount

  alias BankRegistry

  #alias TsbankWeb.Customers.Customer

  action_fallback TsbankWeb.FallbackController

  def index(conn, _params) do
    accounts = Accounts.list_accounts()
    render(conn, :index, accounts: accounts)
  end

  def create(conn, %{"account" => account_params}) do
    # {:ok,user12} = conn.assigns.user.customer
    # IO.inspect(user12)
    # IO.inspect(account = %Customer{})
    #IO.inspect(conn.assigns.user.customer)
    # IO.inspect(conn.assigns.customer.id)
    IO.puts("Checking for some bugs")
    user_id = IO.inspect(conn.assigns.user.id)
    # as am finding id then do the following
    customer_id_on = IO.inspect(Guardian.get_me_id(user_id))
    customer_struct = IO.inspect(Users.get_customer_user(customer_id_on))

    # IO.inspect(BankRegistry.start_link())
    # map = account_params
    # IO.inspect(Map.fetch(map, "accountNumber"))
    # hata = IO.inspect( map["accountNumber"])
    # hata1 = IO.inspect( map["balance"])
    # IO.inspect(BankAccount.start_link(hata, hata))
    # IO.inspect(BankAccount.whereis(hata))
    #IO.inspect(account_params.accountNumber)

    with {:ok, %Account{} = account} <- Accounts.create_account(customer_struct, IO.inspect(account_params)) do
      conn
      |> put_status(:created)
      |> render(:show, account: IO.inspect(account))
    end
  end
 # get specific account
  def view_spec_acc(conn, %{"account_id" => account_id}) do
    account = IO.inspect(Accounts.get_single_account(account_id))
    render(conn, :showaccount, account: account)
  end

  #function to get all accounts for the customer
  def all_accounts(conn, %{"customer_id" => customer_id}) do
    accounts = Accounts.get_customer_accounts(customer_id)
    render(conn, :showdiff, accounts: IO.inspect(accounts))
  end

  def all_accounts_customer(conn, _params) do
    user_id = IO.inspect(conn.assigns.user.id)
    customer_id_on = IO.inspect(Guardian.get_me_id(user_id))
    accounts = Accounts.get_customer_accounts(customer_id_on)
    render(conn, :showdiff, accounts: IO.inspect(accounts))
  end

  # deposit money
  def deposit_money(conn, %{}) do

  end

  ######

  def show(conn, %{"id" => id}) do
    account = Accounts.get_account!(id)
    render(conn, :show, account: account)
  end

  def update(conn, %{"id" => id, "account" => account_params}) do
    account = Accounts.get_account!(id)

    with {:ok, %Account{} = account} <- Accounts.update_account(account, account_params) do
      render(conn, :show, account: account)
    end
  end

  def delete(conn, %{"id" => id}) do
    account = Accounts.get_account!(id)

    with {:ok, %Account{}} <- Accounts.delete_account(account) do
      send_resp(conn, :no_content, "")
    end
  end
end
