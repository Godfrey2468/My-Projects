defmodule JsonTreeViewerWeb.JsonControllerTest do
  use JsonTreeViewerWeb.ConnCase

  import JsonTreeViewer.JsontreeviewerFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  describe "index" do
    test "lists all jsons", %{conn: conn} do
      conn = get(conn, ~p"/jsons")
      assert html_response(conn, 200) =~ "Listing Jsons"
    end
  end

  describe "new json" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/jsons/new")
      assert html_response(conn, 200) =~ "New Json"
    end
  end

  describe "create json" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/jsons", json: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/jsons/#{id}"

      conn = get(conn, ~p"/jsons/#{id}")
      assert html_response(conn, 200) =~ "Json #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/jsons", json: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Json"
    end
  end

  describe "edit json" do
    setup [:create_json]

    test "renders form for editing chosen json", %{conn: conn, json: json} do
      conn = get(conn, ~p"/jsons/#{json}/edit")
      assert html_response(conn, 200) =~ "Edit Json"
    end
  end

  describe "update json" do
    setup [:create_json]

    test "redirects when data is valid", %{conn: conn, json: json} do
      conn = put(conn, ~p"/jsons/#{json}", json: @update_attrs)
      assert redirected_to(conn) == ~p"/jsons/#{json}"

      conn = get(conn, ~p"/jsons/#{json}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, json: json} do
      conn = put(conn, ~p"/jsons/#{json}", json: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Json"
    end
  end

  describe "delete json" do
    setup [:create_json]

    test "deletes chosen json", %{conn: conn, json: json} do
      conn = delete(conn, ~p"/jsons/#{json}")
      assert redirected_to(conn) == ~p"/jsons"

      assert_error_sent 404, fn ->
        get(conn, ~p"/jsons/#{json}")
      end
    end
  end

  defp create_json(_) do
    json = json_fixture()
    %{json: json}
  end
end
