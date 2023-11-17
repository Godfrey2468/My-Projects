defmodule Tsbank.Staffs do
  @moduledoc """
  The Staffs context.
  """

  import Ecto.Query, warn: false
  alias Tsbank.Repo

  alias Tsbank.Staffs.Staff

  @doc """
  Returns the list of staffs.

  ## Examples

      iex> list_staffs()
      [%Staff{}, ...]

  """
  def list_staffs do
    Repo.all(Staff)
  end

  @doc """
  Gets a single staff.

  Raises `Ecto.NoResultsError` if the Staff does not exist.

  ## Examples

      iex> get_staff!(123)
      %Staff{}

      iex> get_staff!(456)
      ** (Ecto.NoResultsError)

  """
  def get_staff!(id), do: Repo.get!(Staff, id)

  @doc """
  Creates a staff.

  ## Examples

      iex> create_staff(%{field: value})
      {:ok, %Staff{}}

      iex> create_staff(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
 def create_staff(admin, attrs \\ %{}) do
  admin
  |> Ecto.build_assoc(:staff)
  |> Staff.changeset(attrs)
  |> Repo.insert()
end


  @doc """
  Updates a staff.

  ## Examples

      iex> update_staff(staff, %{field: new_value})
      {:ok, %Staff{}}

      iex> update_staff(staff, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_staff(%Staff{} = staff, attrs) do
    staff
    |> Staff.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a staff.

  ## Examples

      iex> delete_staff(staff)
      {:ok, %Staff{}}

      iex> delete_staff(staff)
      {:error, %Ecto.Changeset{}}

  """
  def delete_staff(%Staff{} = staff) do
    Repo.delete(staff)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking staff changes.

  ## Examples

      iex> change_staff(staff)
      %Ecto.Changeset{data: %Staff{}}

  """
  def change_staff(%Staff{} = staff, attrs \\ %{}) do
    Staff.changeset(staff, attrs)
  end
end
