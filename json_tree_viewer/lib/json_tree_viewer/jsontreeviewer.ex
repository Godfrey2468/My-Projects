defmodule JsonTreeViewer.Jsontreeviewer do
  @moduledoc """
  The Jsontreeviewer context.
  """

  import Ecto.Query, warn: false
  alias JsonTreeViewer.Repo

  alias JsonTreeViewer.Jsontreeviewer.Json

  @doc """
  Returns the list of json.

  ## Examples

      iex> list_json()
      [%Json{}, ...]

  """
  def list_json do
    Repo.all(Json)
  end

  @doc """
  Gets a single json.

  Raises `Ecto.NoResultsError` if the Json does not exist.

  ## Examples

      iex> get_json!(123)
      %Json{}

      iex> get_json!(456)
      ** (Ecto.NoResultsError)

  """
  def get_json!(id), do: Repo.get!(Json, id)

  @doc """
  Creates a json.

  ## Examples

      iex> create_json(%{field: value})
      {:ok, %Json{}}

      iex> create_json(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_json(attrs \\ %{}) do
    %Json{}
    |> Json.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a json.

  ## Examples

      iex> update_json(json, %{field: new_value})
      {:ok, %Json{}}

      iex> update_json(json, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_json(%Json{} = json, attrs) do
    json
    |> Json.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a json.

  ## Examples

      iex> delete_json(json)
      {:ok, %Json{}}

      iex> delete_json(json)
      {:error, %Ecto.Changeset{}}

  """
  def delete_json(%Json{} = json) do
    Repo.delete(json)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking json changes.

  ## Examples

      iex> change_json(json)
      %Ecto.Changeset{data: %Json{}}

  """
  def change_json(%Json{} = json, attrs \\ %{}) do
    Json.changeset(json, attrs)
  end
end
