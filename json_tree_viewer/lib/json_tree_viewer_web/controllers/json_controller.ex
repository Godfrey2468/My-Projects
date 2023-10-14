defmodule JsonTreeViewerWeb.JsonController do
  use JsonTreeViewerWeb, :controller

  alias JsonTreeViewer.Jsontreeviewer
  alias JsonTreeViewer.Jsontreeviewer.Json

  def index(conn, _params) do
    jsons = Jsontreeviewer.list_jsons()
    render(conn, :index, jsons: jsons)
  end

  def new(conn, _params) do
    changeset = Jsontreeviewer.change_json(%Json{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"json" => json_params}) do
    case Jsontreeviewer.create_json(json_params) do
      {:ok, json} ->
        conn
        |> put_flash(:info, "Json created successfully.")
        |> redirect(to: ~p"/jsons/#{json}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  #def show(conn, %{"id" => id}) do
    #json = Jsontreeviewer.get_json!(id)
   # render(conn, :show, json: json)
#  end

  def show(conn, _params) do
    json_data = %{
      "name" => "John",
      "age" => 30,
      "address" => %{
        "street" => "123 Elm St",
        "city" => "Springfield",
        "state" => "IL"
      },
      "hobbies" => ["Reading", "Gardening"]
    }

    render(conn, "show.json", json: json_data)
  end


  def edit(conn, %{"id" => id}) do
    json = Jsontreeviewer.get_json!(id)
    changeset = Jsontreeviewer.change_json(json)
    render(conn, :edit, json: json, changeset: changeset)
  end

  def update(conn, %{"id" => id, "json" => json_params}) do
    json = Jsontreeviewer.get_json!(id)

    case Jsontreeviewer.update_json(json, json_params) do
      {:ok, json} ->
        conn
        |> put_flash(:info, "Json updated successfully.")
        |> redirect(to: ~p"/jsons/#{json}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, json: json, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    json = Jsontreeviewer.get_json!(id)
    {:ok, _json} = Jsontreeviewer.delete_json(json)

    conn
    |> put_flash(:info, "Json deleted successfully.")
    |> redirect(to: ~p"/jsons")
  end
end
