defmodule Tsbank.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Tsbank.Repo

  alias Tsbank.Accounts.Account

  @doc """
  Returns the list of accounts.

  ## Examples

      iex> list_accounts()
      [%Account{}, ...]

  """
  def list_accounts do
    Repo.all(Account)
  end

  @doc """
  Gets a single account.

  Raises `Ecto.NoResultsError` if the Account does not exist.

  ## Examples

      iex> get_account!(123)
      %Account{}

      iex> get_account!(456)
      ** (Ecto.NoResultsError)

  """
  def get_account!(id), do: Repo.get!(Account, id)

  # get all one account
  def get_single_account(id) do
    Account # our scema file
    |> where(id: ^id)
    # basically is for returning user data wtogether with account
    |> preload([:customer]) # this bcs of the relationship between the two
    |> Repo.one()
  end


    # get all one account
    def get_account_by_number(account_number) do
      Account # our scema file
      |> where(accountNumber: ^account_number)
      # basically is for returning user data wtogether with account
      |> preload([:customer]) # this bcs of the relationship between the two
      |> Repo.one()
    end

  def get_customer_accounts(customer_id) do
    Account # our scema file
    |> where(customer_id: ^customer_id)
    # basically is for returning user data wtogether with account
    |> preload([:customer]) # this bcs of the relationship between the two
    |> Repo.all()
  end


  @doc """
  Creates a account.

  ## Examples

      iex> create_account(%{field: value})
      {:ok, %Account{}}

      iex> create_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_account(customer, attrs \\ %{}) do
    customer
    |> Ecto.build_assoc(:account)
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  def get_full_account_id(id) do
    Account # our scema file
    |> where(customer_id: ^id)
    # basically is for returning user data wtogether with account
    #|> preload([:customer]) # this bcs of the relationship between the two
    |> Repo.one()
  end

  def get_account_name(id) do
    Account # our scema file
    |> where(id: ^id)
    # basically is for returning user data wtogether with account
    #|> preload([:customer]) # this bcs of the relationship between the two
    |> Repo.one()
  end



  def get_account_sartuday(accountNumber) do
    Account # our scema file
    |> where(accountNumber: ^accountNumber)
    # basically is for returning user data wtogether with account
    #|> preload([:customer]) # this bcs of the relationship between the two
    |> Repo.one()
  end

  # get this is as a struct  (aacount_id )
  def get_account_id_use(id), do: Repo.get(Account, id)



  @doc """
  Updates a account.

  ## Examples

      iex> update_account(account, %{field: new_value})
      {:ok, %Account{}}

      iex> update_account(account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_account(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a account.

  ## Examples

      iex> delete_account(account)
      {:ok, %Account{}}

      iex> delete_account(account)
      {:error, %Ecto.Changeset{}}

  """
  def delete_account(%Account{} = account) do
    Repo.delete(account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking account changes.

  ## Examples

      iex> change_account(account)
      %Ecto.Changeset{data: %Account{}}

  """
  def change_account(%Account{} = account, attrs \\ %{}) do
    Account.changeset(account, attrs)
  end
end
