defmodule ProductAlpha.Network do
  @moduledoc """
  The Network context.
  """

  import Ecto.Query, warn: false
  alias ProductAlpha.Repo

  alias ProductAlpha.Network.Specification

  @doc """
  Returns the list of specifications.

  ## Examples

      iex> list_specifications()
      [%Specification{}, ...]

  """
  def list_specifications do
    Repo.all(Specification)
  end

  @doc """
  Gets a single specification.

  Raises `Ecto.NoResultsError` if the Specification does not exist.

  ## Examples

      iex> get_specification!(123)
      %Specification{}

      iex> get_specification!(456)
      ** (Ecto.NoResultsError)

  """
  def get_specification!(id), do: Repo.get!(Specification, id)

  @doc """
  Creates a specification.

  ## Examples

      iex> create_specification(%{field: value})
      {:ok, %Specification{}}

      iex> create_specification(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_specification(attrs \\ %{}) do
    %Specification{}
    |> Specification.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a specification.

  ## Examples

      iex> update_specification(specification, %{field: new_value})
      {:ok, %Specification{}}

      iex> update_specification(specification, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_specification(%Specification{} = specification, attrs) do
    specification
    |> Specification.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a specification.

  ## Examples

      iex> delete_specification(specification)
      {:ok, %Specification{}}

      iex> delete_specification(specification)
      {:error, %Ecto.Changeset{}}

  """
  def delete_specification(%Specification{} = specification) do
    Repo.delete(specification)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking specification changes.

  ## Examples

      iex> change_specification(specification)
      %Ecto.Changeset{data: %Specification{}}

  """
  def change_specification(%Specification{} = specification, attrs \\ %{}) do
    Specification.changeset(specification, attrs)
  end

  alias ProductAlpha.Network.Notification

  @doc """
  Returns the list of notifications.

  ## Examples

      iex> list_notifications()
      [%Notification{}, ...]

  """
  def list_notifications do
    Repo.all(Notification)
  end

  @doc """
  Gets a single notification.

  Raises `Ecto.NoResultsError` if the Notification does not exist.

  ## Examples

      iex> get_notification!(123)
      %Notification{}

      iex> get_notification!(456)
      ** (Ecto.NoResultsError)

  """
  def get_notification!(id), do: Repo.get!(Notification, id)

  @doc """
  Creates a notification.

  ## Examples

      iex> create_notification(%{field: value})
      {:ok, %Notification{}}

      iex> create_notification(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_notification(attrs \\ %{}) do
    %Notification{}
    |> Notification.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a notification.

  ## Examples

      iex> update_notification(notification, %{field: new_value})
      {:ok, %Notification{}}

      iex> update_notification(notification, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_notification(%Notification{} = notification, attrs) do
    notification
    |> Notification.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a notification.

  ## Examples

      iex> delete_notification(notification)
      {:ok, %Notification{}}

      iex> delete_notification(notification)
      {:error, %Ecto.Changeset{}}

  """
  def delete_notification(%Notification{} = notification) do
    Repo.delete(notification)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking notification changes.

  ## Examples

      iex> change_notification(notification)
      %Ecto.Changeset{data: %Notification{}}

  """
  def change_notification(%Notification{} = notification, attrs \\ %{}) do
    Notification.changeset(notification, attrs)
  end

  alias ProductAlpha.Network.Resource

  @doc """
  Returns the list of resources.

  ## Examples

      iex> list_resources()
      [%Resource{}, ...]

  """
  def list_resources do
    Repo.all(Resource)
  end

  @doc """
  Gets a single resource.

  Raises `Ecto.NoResultsError` if the Resource does not exist.

  ## Examples

      iex> get_resource!(123)
      %Resource{}

      iex> get_resource!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resource!(id), do: Repo.get!(Resource, id)

  @doc """
  Creates a resource.

  ## Examples

      iex> create_resource(%{field: value})
      {:ok, %Resource{}}

      iex> create_resource(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resource(attrs \\ %{}) do
    %Resource{}
    |> Resource.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a resource.

  ## Examples

      iex> update_resource(resource, %{field: new_value})
      {:ok, %Resource{}}

      iex> update_resource(resource, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resource(%Resource{} = resource, attrs) do
    resource
    |> Resource.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a resource.

  ## Examples

      iex> delete_resource(resource)
      {:ok, %Resource{}}

      iex> delete_resource(resource)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resource(%Resource{} = resource) do
    Repo.delete(resource)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resource changes.

  ## Examples

      iex> change_resource(resource)
      %Ecto.Changeset{data: %Resource{}}

  """
  def change_resource(%Resource{} = resource, attrs \\ %{}) do
    Resource.changeset(resource, attrs)
  end
end
