defmodule JsonTreeViewer.JsontreeviewerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `JsonTreeViewer.Jsontreeviewer` context.
  """

  @doc """
  Generate a json.
  """
  def json_fixture(attrs \\ %{}) do
    {:ok, json} =
      attrs
      |> Enum.into(%{
        jsondata: "some jsondata",
        jsons: "some jsons"
      })
      |> JsonTreeViewer.Jsontreeviewer.create_json()

    json
  end

end
