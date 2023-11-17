defmodule ProductAlpha.Serviceprovider do
  @moduledoc """
  The Serviceprovider context.
  """

  import Ecto.Query, warn: false
  alias ProductAlpha.Repo

  alias ProductAlpha.Serviceprovider.Serviceproviders

  @doc """
  Returns the list of serviceprovides.

  ## Examples

      iex> list_serviceprovides()
      [%Serviceproviders{}, ...]

  """
  def list_serviceprovides do
    Repo.all(Serviceproviders)
  end

  @doc """
  Gets a single serviceproviders.

  Raises `Ecto.NoResultsError` if the Serviceproviders does not exist.

  ## Examples

      iex> get_serviceproviders!(123)
      %Serviceproviders{}

      iex> get_serviceproviders!(456)
      ** (Ecto.NoResultsError)

  """
  def get_serviceproviders!(id), do: Repo.get!(Serviceproviders, id)

  @doc """
  Creates a serviceproviders.

  ## Examples

      iex> create_serviceproviders(%{field: value})
      {:ok, %Serviceproviders{}}

      iex> create_serviceproviders(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_serviceproviders(product, attrs \\ %{}) do
  #  %Serviceproviders{}
   product
    |> Ecto.build_assoc(:serviceproviders)
    |> Serviceproviders.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a serviceproviders.

  ## Examples

      iex> update_serviceproviders(serviceproviders, %{field: new_value})
      {:ok, %Serviceproviders{}}

      iex> update_serviceproviders(serviceproviders, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_serviceproviders(%Serviceproviders{} = serviceproviders, attrs) do
    serviceproviders
    |> Serviceproviders.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a serviceproviders.

  ## Examples

      iex> delete_serviceproviders(serviceproviders)
      {:ok, %Serviceproviders{}}

      iex> delete_serviceproviders(serviceproviders)
      {:error, %Ecto.Changeset{}}

  """
  def delete_serviceproviders(%Serviceproviders{} = serviceproviders) do
    Repo.delete(serviceproviders)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking serviceproviders changes.

  ## Examples

      iex> change_serviceproviders(serviceproviders)
      %Ecto.Changeset{data: %Serviceproviders{}}

  """
  def change_serviceproviders(%Serviceproviders{} = serviceproviders, attrs \\ %{}) do
    Serviceproviders.changeset(serviceproviders, attrs)
  end
end
