defmodule Tsbank.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Tsbank.Repo

  alias Tsbank.Users.User

  alias Tsbank.Customers.Customer

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  #def get_usercust!(user_id), do: Repo.get!(Customer, user_id)

  def get_full_user(id) do
    User # our scema file
    |> where(id: ^id)
    # basically is for returning user data wtogether with account
    |> preload([:customer]) # this bcs of the relationship between the two
    |> Repo.one()
  end


  def get_full_userhhh(id) do
    Customer # our scema file
    |> where(user_id: ^id)
    # basically is for returning user data wtogether with account
    #|> preload([:customer]) # this bcs of the relationship between the two
    |> Repo.one()
  end

  def get_customer_user(id), do: Repo.get(Customer, id)

  # def get_full_userss(id) do
  #   Customer # our scema file
  #   |> where(user_id: ^id)
  #   # basically is for returning user data wtogether with account
  #   |> Repo.one()
  # end

   @doc """
  Gets a single user.any()

  Returns 'nil' if the User does not exist.

  ## Examples

      iex> get_user_by_email(test@email.com)
      %User{}

      iex> get_user_by_email(no_account@email.com)
       nil


  """
  def get_user_by_email(email) do
    # This is our schema
    User
    |> where(email: ^email)
    |> Repo.one() # Getting one value bcs emails set them as unique
  end


  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
end
