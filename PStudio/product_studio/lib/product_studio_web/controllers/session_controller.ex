defmodule ProductStudioWeb.SessionController do
  use ProductStudioWeb, :controller

  alias ProductStudio.Auth
  alias ProductStudio.Auth.Session

  def index(conn, _params) do
    session = Auth.list_session()
    render(conn, :index, session: session)
  end

  def new(conn, _params) do
    changeset = Auth.change_session(%Session{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"session" => session_params}) do
    case Auth.create_session(session_params) do
      {:ok, session} ->
        conn
        |> put_flash(:info, "Session created successfully.")
        |> redirect(to: ~p"/session/#{session}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    session = Auth.get_session!(id)
    render(conn, :show, session: session)
  end

  def edit(conn, %{"id" => id}) do
    session = Auth.get_session!(id)
    changeset = Auth.change_session(session)
    render(conn, :edit, session: session, changeset: changeset)
  end

  def update(conn, %{"id" => id, "session" => session_params}) do
    session = Auth.get_session!(id)

    case Auth.update_session(session, session_params) do
      {:ok, session} ->
        conn
        |> put_flash(:info, "Session updated successfully.")
        |> redirect(to: ~p"/session/#{session}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, session: session, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    session = Auth.get_session!(id)
    {:ok, _session} = Auth.delete_session(session)

    conn
    |> put_flash(:info, "Session deleted successfully.")
    |> redirect(to: ~p"/session")
  end
end
