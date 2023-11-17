defmodule TsbankWeb.TransactionController do
    @moduledoc """
  This module is responsible for handling transactions within the Tsbank application.

  It provides endpoints for creating, listing, showing, updating, and deleting transactions.
  """

  use TsbankWeb, :controller

  alias Tsbank.Transactions
  alias Tsbank.Transactions.Transaction

  alias TsbankWeb.Auth.Guardian

  alias Tsbank.Accounts

  alias Tsbank.Accounts.Account

  alias BankRegistry

  alias BankAccount


  action_fallback TsbankWeb.FallbackController

  @doc """
  List transactions.

  This function retrieves a list of all transactions and renders them in the 'index' view.

  ## Params

  - `conn`: The connection struct
  - `_params`: Unused parameters

  ## Returns

  - `conn`: The connection struct
  """

  def index(conn, _params) do
    transactions = Transactions.list_transactions()
    render(conn, :index, transactions: transactions)
  end

   @doc """
  Create a transaction.

  This function handles the creation of a transaction, including depositing or withdrawing money from an account.

  ## Params

  - `conn`: The connection struct
  - `account_id`: The account ID for the transaction
  - `transaction_params`: A map containing transaction parameters

  ## Returns

  - `conn`: The connection struct
  """

  def create(conn, %{"account_id" => account_id, "transaction" => transaction_params}) do

    user_id_from_session = IO.inspect(conn.assigns.user.id)

    customer_id_by = IO.inspect(Guardian.get_me_id(user_id_from_session))

    cust_id_st = IO.inspect(Guardian.get_me_account_id(customer_id_by))
    acc_struct = IO.inspect(Accounts.get_account_id_use(cust_id_st))

    IO.puts("Debug")
    with {:ok, %Transaction{} = transaction} <- Transactions.create_transaction(acc_struct,transaction_params),
    name_acc  <- IO.inspect(Guardian.get_that_account_name(account_id)),
    {:ok, pid1} <- IO.inspect(BankAccount.start_link(name_acc)),

     {:ok, my_balance} <- IO.inspect(BankAccount.deposit(pid1,name_acc, transaction.amount)),
     :ok <- BankAccount.stop(pid1)
     do
      conn
      |> put_status(:created)
      |> render(:show, transaction: transaction, my_balance: my_balance)
    end

  end

   @doc """
  Show a transaction.

  This function retrieves and renders the details of a transaction by its ID.

  ## Params

  - `conn`: The connection struct
  - `id`: The transaction ID

  ## Returns

  - `conn`: The connection struct
  """

  def show(conn, %{"id" => id}) do
    transaction = Transactions.get_transaction!(id)
    render(conn, :show, transaction: transaction)
  end

    @doc """
  Remove money from an account.

  This function handles the creation of a withdrawal transaction, effectively removing money from an account.

  ## Params

  - `conn`: The connection struct
  - `account_id`: The account ID for the transaction
  - `transaction_params`: A map containing withdrawal transaction parameters

  ## Returns

  - `conn`: The connection struct
  """

  def remove_money(conn, %{"account_id" => account_id, "transaction" => transaction_params}) do
    user_id_from_session = IO.inspect(conn.assigns.user.id)

    customer_id_by = IO.inspect(Guardian.get_me_id(user_id_from_session))

    cust_id_st = IO.inspect(Guardian.get_me_account_id(customer_id_by))
    acc_struct = IO.inspect(Accounts.get_account_id_use(cust_id_st))

    IO.puts("Debug_My_Code")
    with {:ok, %Transaction{} = transaction} <- Transactions.create_transaction(acc_struct,transaction_params),
    name_acc  <- IO.inspect(Guardian.get_that_account_name(account_id)),

    {:ok, pid1}  <- IO.inspect(BankAccount.start_link(name_acc)),

    {:ok, my_balance} <- IO.inspect(BankAccount.withdraw(pid1,name_acc, transaction.amount)),
    :ok <- BankAccount.stop(pid1)
     do
      conn
      |> put_status(:created)
      |> render(:show, transaction: transaction, my_balance: my_balance)
    end
  end

  # ----------------------------------------------------------------------------------------

  def transfer(conn, %{"bank_name" => bank_name, "amount" => amount, "destination_account_num" => destination_account_num}) do
    # Perform the transfer logic, update balances, etc.
    # This could include making changes to your local database.
    # Notify the receiver (Project B) about the transfer

    id = get_session(conn, :user_id)

    customer = Guardian.get_me_id(id)
    account = Accounts.get_customer_accounts_by_id(customer)
    account_map = Map.from_struct(account)

    IO.inspect(account_map)
    accbalance = Map.get(account_map, :balance)
    IO.inspect(accbalance)
    if accbalance >= amount do
      Accounts.update_account(%Account{} = account, %{balance: account.balance - amount})
      send_notification_to_project_b(bank_name, destination_account_num, amount)
      conn
        |> put_status(:ok)
        |> json(%{message: "Transfer successful"})
    else
      conn
        |> put_status(404)
        |> json(%{message: "Transfer Amount is greater than balance"})
    end
  end

  # ------------------------------------------------------------------------------------------

  defp send_notification_to_project_b(bank_name, destination_account_num, amount) do
    # Use HTTPoison or another HTTP client to make a POST request to Project B

    case bank_name do


      "sipho" ->
        url = "http://192.168.1.222:4090/api/v1/notify_transfer"
        body = %{bank_name: bank_name, amount: amount, destination_account_num: destination_account_num}
        HTTPoison.post(url, Poison.encode!(body), [{"Content-Type", "application/json"}])

      "hata" ->
        url = "http://192.168.1.222:4003/api/v1/notify_transfer"
        body = %{bank_name: bank_name, amount: amount, destination_account_num: destination_account_num}
        HTTPoison.post(url, Poison.encode!(body), [{"Content-Type", "application/json"}])

      "kevin" ->
        url = "http://192.168.1.222:4005/api/v1/notify_transfer"
        body = %{bank_name: bank_name, amount: amount, destination_account_num: destination_account_num}
        HTTPoison.post(url, Poison.encode!(body), [{"Content-Type", "application/json"}])

      "sami" ->
        url = "http://192.168.1.222:4006/api/notify_transfer"
        body = %{bank_name: bank_name, amount: amount, destination_account_num: destination_account_num}
        HTTPoison.post(url, Poison.encode!(body), [{"Content-Type", "application/json"}])
    end
   Poison.post(url, Poison.encode!(body), [{"Content-Type", "application/json"}])
  end

  def update(conn, %{"id" => id, "transaction" => transaction_params}) do
    transaction = Transactions.get_transaction!(id)

    with {:ok, %Transaction{} = transaction} <- Transactions.update_transaction(transaction, transaction_params) do
      render(conn, :show, transaction: transaction)
    end
  end

  def delete(conn, %{"id" => id}) do
    transaction = Transactions.get_transaction!(id)

    with {:ok, %Transaction{}} <- Transactions.delete_transaction(transaction) do
      send_resp(conn, :no_content, "")
    end
  end

  # ----------------------------------------------------------------------------------------

  def notify_transfer(conn, %{"amount" => amount, "destination_account_num" => destination_account_num}) do
    # Perform the necessary actions on Project B, such as updating balances

    IO.inspect(amount)
    IO.inspect(destination_account_num)

    conn
    |> put_status(:ok)
    |> json(%{message: "Transfer notification received"})
  end


end
