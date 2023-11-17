defmodule TsbankWeb.StaffControllerTest do
  use TsbankWeb.ConnCase

  import Tsbank.StaffsFixtures

  alias Tsbank.Staffs.Staff

  @create_attrs %{
    moreinfo: "some moreinfo"
  }
  @update_attrs %{
    moreinfo: "some updated moreinfo"
  }
  @invalid_attrs %{moreinfo: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all staffs", %{conn: conn} do
      conn = get(conn, ~p"/api/staffs")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create staff" do
    test "renders staff when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/staffs", staff: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/staffs/#{id}")

      assert %{
               "id" => ^id,
               "moreinfo" => "some moreinfo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/staffs", staff: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update staff" do
    setup [:create_staff]

    test "renders staff when data is valid", %{conn: conn, staff: %Staff{id: id} = staff} do
      conn = put(conn, ~p"/api/staffs/#{staff}", staff: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/staffs/#{id}")

      assert %{
               "id" => ^id,
               "moreinfo" => "some updated moreinfo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, staff: staff} do
      conn = put(conn, ~p"/api/staffs/#{staff}", staff: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete staff" do
    setup [:create_staff]

    test "deletes chosen staff", %{conn: conn, staff: staff} do
      conn = delete(conn, ~p"/api/staffs/#{staff}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/staffs/#{staff}")
      end
    end
  end

  defp create_staff(_) do
    staff = staff_fixture()
    %{staff: staff}
  end
end
