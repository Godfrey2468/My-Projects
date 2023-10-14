defmodule TsbankWeb.TransactionController do
  use TsbankWeb, :controller

  alias Tsbank.Transactions
  alias Tsbank.Transactions.Transaction

  alias TsbankWeb.Auth.Guardian

  alias Tsbank.Accounts

  alias Tsbank.Accounts.Account

  alias BankRegistry

  alias BankAccount


  action_fallback TsbankWeb.FallbackController

  def index(conn, _params) do
    transactions = Transactions.list_transactions()
    render(conn, :index, transactions: transactions)
  end

  def create(conn, %{"account_id" => account_id, "transaction" => transaction_params}) do
    user_id_from_session = IO.inspect(conn.assigns.user.id)
    #function to get customer id but pass user id
    customer_id_by = IO.inspect(Guardian.get_me_id(user_id_from_session))
    #function to get account id but pass customer id
    cust_id_st = IO.inspect(Guardian.get_me_account_id(customer_id_by))
    acc_struct = IO.inspect(Accounts.get_account_id_use(cust_id_st))
    # Do the genserver staff here
    # IO.inspect(BankRegistry.start_link())
    # map = account_params
    # IO.inspect(Map.fetch(map, "accountNumber"))
    # hata = IO.inspect( map["accountNumber"])
    # hata1 = IO.inspect( map["balance"])
    # IO.inspect(BankAccount.start_link(hata, hata1))
    # IO.inspect(BankAccount.whereis(hata))
    ## Genserver and registry staff
    #~~~~~~~~~~~~~~
    #IO.inspect(BankRegistry.start_link())
    # map = account_params
    # IO.inspect(Map.fetch(map, "accountNumber"))
    # hata = IO.inspect( map["accountNumber"])
    # hata1 = IO.inspect( map["balance"])
    # IO.inspect(BankAccount.start_link(hata, hata))
    # IO.inspect(BankAccount.whereis(hata))
    #~~~~~~~~~~~~~~
    # my_map = transaction_params
    #get_account_id_use
    IO.puts("Do some debuggings")
    with {:ok, %Transaction{} = transaction} <- Transactions.create_transaction(acc_struct,transaction_params),
    name_acc  <- IO.inspect(Guardian.get_that_account_name(account_id)),
    {:ok, pid1} <- IO.inspect(BankAccount.start_link(name_acc)),
    # pid <- IO.inspect(BankAccount.whereis(namemine)),
     {:ok, my_balance} <- IO.inspect(BankAccount.deposit(pid1,name_acc, transaction.amount)),
     :ok <- BankAccount.stop(pid1)
     do
      conn
      |> put_status(:created)
      |> render(:show, transaction: transaction, my_balance: my_balance)
    end

  end

  def show(conn, %{"id" => id}) do
    transaction = Transactions.get_transaction!(id)
    render(conn, :show, transaction: transaction)
  end

  def remove_money(conn, %{"account_id" => account_id, "transaction" => transaction_params}) do
    user_id_from_session = IO.inspect(conn.assigns.user.id)
    #function to get customer id but pass user id
    customer_id_by = IO.inspect(Guardian.get_me_id(user_id_from_session))
    #function to get account id but pass customer id
    cust_id_st = IO.inspect(Guardian.get_me_account_id(customer_id_by))
    acc_struct = IO.inspect(Accounts.get_account_id_use(cust_id_st))

    IO.puts("Do some debuggings")
    with {:ok, %Transaction{} = transaction} <- Transactions.create_transaction(acc_struct,transaction_params),
    name_acc  <- IO.inspect(Guardian.get_that_account_name(account_id)),
    #my_balance <- BankAccount.testope(name_acc, transaction.amount)
    {:ok, pid1}  <- IO.inspect(BankAccount.start_link(name_acc)),
    # pid <- IO.inspect(BankAccount.whereis(namemine)),
    {:ok, my_balance} <- IO.inspect(BankAccount.withdraw(pid1,name_acc, transaction.amount)),
    :ok <- BankAccount.stop(pid1)
     do
      # case IO.inspect(BankAccount.start_link(name_acc)) do
      #   {:ok, pid1} -> {:ok, my_balance} = IO.inspect(BankAccount.withdraw(pid1,name_acc, transaction.amount))
      #   {:error, {:message, pid1}} -> {:ok, my_balance} = IO.inspect(BankAccount.withdraw(pid1,name_acc, transaction.amount))
      # end
      conn
      |> put_status(:created)
      |> render(:show, transaction: transaction, my_balance: my_balance)
    end
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
end
