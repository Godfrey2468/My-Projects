defmodule ProductAlpha.Recharge do
  @moduledoc """
  The Recharge context.
  """

  import Ecto.Query, warn: false
  alias ProductAlpha.Repo

  alias ProductAlpha.Recharge.Defaultrec

  @doc """
  Returns the list of defaultrecs.

  ## Examples

      iex> list_defaultrecs()
      [%Defaultrec{}, ...]

  """
  def list_defaultrecs do
    Repo.all(Defaultrec)
  end

  @doc """
  Gets a single defaultrec.

  Raises `Ecto.NoResultsError` if the Defaultrec does not exist.

  ## Examples

      iex> get_defaultrec!(123)
      %Defaultrec{}

      iex> get_defaultrec!(456)
      ** (Ecto.NoResultsError)

  """
  def get_defaultrec!(id), do: Repo.get!(Defaultrec, id)

  @doc """
  Creates a defaultrec.

  ## Examples

      iex> create_defaultrec(%{field: value})
      {:ok, %Defaultrec{}}

      iex> create_defaultrec(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_defaultrec(attrs \\ %{}) do
    %Defaultrec{}
    |> Defaultrec.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a defaultrec.

  ## Examples

      iex> update_defaultrec(defaultrec, %{field: new_value})
      {:ok, %Defaultrec{}}

      iex> update_defaultrec(defaultrec, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_defaultrec(%Defaultrec{} = defaultrec, attrs) do
    defaultrec
    |> Defaultrec.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a defaultrec.

  ## Examples

      iex> delete_defaultrec(defaultrec)
      {:ok, %Defaultrec{}}

      iex> delete_defaultrec(defaultrec)
      {:error, %Ecto.Changeset{}}

  """
  def delete_defaultrec(%Defaultrec{} = defaultrec) do
    Repo.delete(defaultrec)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking defaultrec changes.

  ## Examples

      iex> change_defaultrec(defaultrec)
      %Ecto.Changeset{data: %Defaultrec{}}

  """
  def change_defaultrec(%Defaultrec{} = defaultrec, attrs \\ %{}) do
    Defaultrec.changeset(defaultrec, attrs)
  end

  alias ProductAlpha.Recharge.Smsmap

  @doc """
  Returns the list of smsmaps.

  ## Examples

      iex> list_smsmaps()
      [%Smsmap{}, ...]

  """
  def list_smsmaps do
    Repo.all(Smsmap)
  end

  @doc """
  Gets a single smsmap.

  Raises `Ecto.NoResultsError` if the Smsmap does not exist.

  ## Examples

      iex> get_smsmap!(123)
      %Smsmap{}

      iex> get_smsmap!(456)
      ** (Ecto.NoResultsError)

  """
  def get_smsmap!(id), do: Repo.get!(Smsmap, id)

  @doc """
  Creates a smsmap.

  ## Examples

      iex> create_smsmap(%{field: value})
      {:ok, %Smsmap{}}

      iex> create_smsmap(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_smsmap(attrs \\ %{}) do
    %Smsmap{}
    |> Smsmap.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a smsmap.

  ## Examples

      iex> update_smsmap(smsmap, %{field: new_value})
      {:ok, %Smsmap{}}

      iex> update_smsmap(smsmap, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_smsmap(%Smsmap{} = smsmap, attrs) do
    smsmap
    |> Smsmap.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a smsmap.

  ## Examples

      iex> delete_smsmap(smsmap)
      {:ok, %Smsmap{}}

      iex> delete_smsmap(smsmap)
      {:error, %Ecto.Changeset{}}

  """
  def delete_smsmap(%Smsmap{} = smsmap) do
    Repo.delete(smsmap)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking smsmap changes.

  ## Examples

      iex> change_smsmap(smsmap)
      %Ecto.Changeset{data: %Smsmap{}}

  """
  def change_smsmap(%Smsmap{} = smsmap, attrs \\ %{}) do
    Smsmap.changeset(smsmap, attrs)
  end

  alias ProductAlpha.Recharge.Datamap

  @doc """
  Returns the list of datamaps.

  ## Examples

      iex> list_datamaps()
      [%Datamap{}, ...]

  """
  def list_datamaps do
    Repo.all(Datamap)
  end

  @doc """
  Gets a single datamap.

  Raises `Ecto.NoResultsError` if the Datamap does not exist.

  ## Examples

      iex> get_datamap!(123)
      %Datamap{}

      iex> get_datamap!(456)
      ** (Ecto.NoResultsError)

  """
  def get_datamap!(id), do: Repo.get!(Datamap, id)

  @doc """
  Creates a datamap.

  ## Examples

      iex> create_datamap(%{field: value})
      {:ok, %Datamap{}}

      iex> create_datamap(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_datamap(attrs \\ %{}) do
    %Datamap{}
    |> Datamap.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a datamap.

  ## Examples

      iex> update_datamap(datamap, %{field: new_value})
      {:ok, %Datamap{}}

      iex> update_datamap(datamap, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_datamap(%Datamap{} = datamap, attrs) do
    datamap
    |> Datamap.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a datamap.

  ## Examples

      iex> delete_datamap(datamap)
      {:ok, %Datamap{}}

      iex> delete_datamap(datamap)
      {:error, %Ecto.Changeset{}}

  """
  def delete_datamap(%Datamap{} = datamap) do
    Repo.delete(datamap)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking datamap changes.

  ## Examples

      iex> change_datamap(datamap)
      %Ecto.Changeset{data: %Datamap{}}

  """
  def change_datamap(%Datamap{} = datamap, attrs \\ %{}) do
    Datamap.changeset(datamap, attrs)
  end

  alias ProductAlpha.Recharge.Voicemap

  @doc """
  Returns the list of voicemaps.

  ## Examples

      iex> list_voicemaps()
      [%Voicemap{}, ...]

  """
  def list_voicemaps do
    Repo.all(Voicemap)
  end

  @doc """
  Gets a single voicemap.

  Raises `Ecto.NoResultsError` if the Voicemap does not exist.

  ## Examples

      iex> get_voicemap!(123)
      %Voicemap{}

      iex> get_voicemap!(456)
      ** (Ecto.NoResultsError)

  """
  def get_voicemap!(id), do: Repo.get!(Voicemap, id)

  @doc """
  Creates a voicemap.

  ## Examples

      iex> create_voicemap(%{field: value})
      {:ok, %Voicemap{}}

      iex> create_voicemap(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_voicemap(attrs \\ %{}) do
    %Voicemap{}
    |> Voicemap.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a voicemap.

  ## Examples

      iex> update_voicemap(voicemap, %{field: new_value})
      {:ok, %Voicemap{}}

      iex> update_voicemap(voicemap, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_voicemap(%Voicemap{} = voicemap, attrs) do
    voicemap
    |> Voicemap.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a voicemap.

  ## Examples

      iex> delete_voicemap(voicemap)
      {:ok, %Voicemap{}}

      iex> delete_voicemap(voicemap)
      {:error, %Ecto.Changeset{}}

  """
  def delete_voicemap(%Voicemap{} = voicemap) do
    Repo.delete(voicemap)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking voicemap changes.

  ## Examples

      iex> change_voicemap(voicemap)
      %Ecto.Changeset{data: %Voicemap{}}

  """
  def change_voicemap(%Voicemap{} = voicemap, attrs \\ %{}) do
    Voicemap.changeset(voicemap, attrs)
  end

  alias ProductAlpha.Recharge.Defaultmap

  @doc """
  Returns the list of defaultmaps.

  ## Examples

      iex> list_defaultmaps()
      [%Defaultmap{}, ...]

  """
  def list_defaultmaps do
    Repo.all(Defaultmap)
  end

  @doc """
  Gets a single defaultmap.

  Raises `Ecto.NoResultsError` if the Defaultmap does not exist.

  ## Examples

      iex> get_defaultmap!(123)
      %Defaultmap{}

      iex> get_defaultmap!(456)
      ** (Ecto.NoResultsError)

  """
  def get_defaultmap!(id), do: Repo.get!(Defaultmap, id)

  @doc """
  Creates a defaultmap.

  ## Examples

      iex> create_defaultmap(%{field: value})
      {:ok, %Defaultmap{}}

      iex> create_defaultmap(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_defaultmap(attrs \\ %{}) do
    %Defaultmap{}
    |> Defaultmap.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a defaultmap.

  ## Examples

      iex> update_defaultmap(defaultmap, %{field: new_value})
      {:ok, %Defaultmap{}}

      iex> update_defaultmap(defaultmap, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_defaultmap(%Defaultmap{} = defaultmap, attrs) do
    defaultmap
    |> Defaultmap.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a defaultmap.

  ## Examples

      iex> delete_defaultmap(defaultmap)
      {:ok, %Defaultmap{}}

      iex> delete_defaultmap(defaultmap)
      {:error, %Ecto.Changeset{}}

  """
  def delete_defaultmap(%Defaultmap{} = defaultmap) do
    Repo.delete(defaultmap)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking defaultmap changes.

  ## Examples

      iex> change_defaultmap(defaultmap)
      %Ecto.Changeset{data: %Defaultmap{}}

  """
  def change_defaultmap(%Defaultmap{} = defaultmap, attrs \\ %{}) do
    Defaultmap.changeset(defaultmap, attrs)
  end
end
