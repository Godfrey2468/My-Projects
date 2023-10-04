defmodule ProductStudioWeb.SessionControllerTest do
  use ProductStudioWeb.ConnCase

  import ProductStudio.AuthFixtures

  @create_attrs %{new: "some new"}
  @update_attrs %{new: "some updated new"}
  @invalid_attrs %{new: nil}

  describe "index" do
    test "lists all session", %{conn: conn} do
      conn = get(conn, ~p"/session")
      assert html_response(conn, 200) =~ "Listing Session"
    end
  end

  describe "new session" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/session/new")
      assert html_response(conn, 200) =~ "New Session"
    end
  end

  describe "create session" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/session", session: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/session/#{id}"

      conn = get(conn, ~p"/session/#{id}")
      assert html_response(conn, 200) =~ "Session #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/session", session: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Session"
    end
  end

  describe "edit session" do
    setup [:create_session]

    test "renders form for editing chosen session", %{conn: conn, session: session} do
      conn = get(conn, ~p"/session/#{session}/edit")
      assert html_response(conn, 200) =~ "Edit Session"
    end
  end

  describe "update session" do
    setup [:create_session]

    test "redirects when data is valid", %{conn: conn, session: session} do
      conn = put(conn, ~p"/session/#{session}", session: @update_attrs)
      assert redirected_to(conn) == ~p"/session/#{session}"

      conn = get(conn, ~p"/session/#{session}")
      assert html_response(conn, 200) =~ "some updated new"
    end

    test "renders errors when data is invalid", %{conn: conn, session: session} do
      conn = put(conn, ~p"/session/#{session}", session: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Session"
    end
  end

  describe "delete session" do
    setup [:create_session]

    test "deletes chosen session", %{conn: conn, session: session} do
      conn = delete(conn, ~p"/session/#{session}")
      assert redirected_to(conn) == ~p"/session"

      assert_error_sent 404, fn ->
        get(conn, ~p"/session/#{session}")
      end
    end
  end

  defp create_session(_) do
    session = session_fixture()
    %{session: session}
  end
end
