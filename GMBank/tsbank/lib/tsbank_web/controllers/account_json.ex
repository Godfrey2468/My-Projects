defmodule TsbankWeb.AccountJSON do
  alias Tsbank.Accounts.Account
  alias BankAccount

  @doc """
  Renders a list of accounts.
  """
  def index(%{accounts: accounts}) do
    %{data: for(account <- accounts, do: data(account))}
  end

  @doc """
  Renders a single account.
  """
  def show(%{account: account}) do
    %{data: data(account)}
  end

  def showmine(%{account: account}) do
   %{data: datashow(account)}

  end

  #To render specific account
  def showaccount(%{account: account}) do
    %{data: data(account)}
  end
  #showdiff

  def showdiff(%{accounts: accounts}) do
    # %{data: data(account)}
    %{data: for(account <- accounts, do: data(account))}

  end

  defp datashow(%Account{} = account) do
    %{
      id: account.id,
      accountNumber: IO.inspect(account.accountNumber),
      status: account.status,
      interestRate: account.interestRate,
      overdraftLimit: account.overdraftLimit,
      branchCode: account.branchCode,
      type: account.type,
      lastTransactionDate: account.lastTransactionDate,
      balance: account.balance

    }

  end

  def gg(accountNumber, balance) do
    IO.inspect(BankAccount.start_link(accountNumber, balance))
  end
  defp data(%Account{} = account) do
    %{
      id: account.id,
      accountNumber: IO.inspect(account.accountNumber),
      status: account.status,
      interestRate: account.interestRate,
      overdraftLimit: account.overdraftLimit,
      branchCode: account.branchCode,
      type: account.type,
      lastTransactionDate: account.lastTransactionDate,
      balance: account.balance
    }
  end
end
