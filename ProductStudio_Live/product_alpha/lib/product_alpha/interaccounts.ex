defmodule ProductAlpha.Interaccounts do
  @moduledoc """
  The Interaccounts context.
  """

  import Ecto.Query, warn: false
  alias ProductAlpha.Repo

  alias ProductAlpha.Interaccounts.Interaccount

  @doc """
  Returns the list of interaccounts.

  ## Examples

      iex> list_interaccounts()
      [%Interaccount{}, ...]

  """
  def list_interaccounts do
    Repo.all(Interaccount)
  end

  @doc """
  Gets a single interaccount.

  Raises `Ecto.NoResultsError` if the Interaccount does not exist.

  ## Examples

      iex> get_interaccount!(123)
      %Interaccount{}

      iex> get_interaccount!(456)
      ** (Ecto.NoResultsError)

  """
  def get_interaccount!(id), do: Repo.get!(Interaccount, id)

  @doc """
  Creates a interaccount.

  ## Examples

      iex> create_interaccount(%{field: value})
      {:ok, %Interaccount{}}

      iex> create_interaccount(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_interaccount(product, attrs \\ %{}) do
   # %Interaccount{}
    product
    |> Ecto.build_assoc(:interaccount)
    |> Interaccount.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a interaccount.

  ## Examples

      iex> update_interaccount(interaccount, %{field: new_value})
      {:ok, %Interaccount{}}

      iex> update_interaccount(interaccount, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_interaccount(%Interaccount{} = interaccount, attrs) do
    interaccount
    |> Interaccount.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a interaccount.

  ## Examples

      iex> delete_interaccount(interaccount)
      {:ok, %Interaccount{}}

      iex> delete_interaccount(interaccount)
      {:error, %Ecto.Changeset{}}

  """
  def delete_interaccount(%Interaccount{} = interaccount) do
    Repo.delete(interaccount)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking interaccount changes.

  ## Examples

      iex> change_interaccount(interaccount)
      %Ecto.Changeset{data: %Interaccount{}}

  """
  def change_interaccount(%Interaccount{} = interaccount, attrs \\ %{}) do
    Interaccount.changeset(interaccount, attrs)
  end
end
