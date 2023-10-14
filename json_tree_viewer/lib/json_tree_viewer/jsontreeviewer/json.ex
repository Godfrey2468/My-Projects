defmodule JsonTreeViewer.Jsontreeviewer.Json do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jsons" do


    timestamps()
  end

  @doc false
  def changeset(json, attrs) do
    json
    |> cast(attrs, [])
    |> validate_required([])
  end
end
