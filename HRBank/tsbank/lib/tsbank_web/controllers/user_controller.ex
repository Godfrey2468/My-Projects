defmodule TsbankWeb.UserController do
  use TsbankWeb, :controller

  alias Tsbank.Users
  alias Tsbank.Users.User

  alias TsbankWeb.Auth.Guardian
  alias TsbankWeb.Auth.ErrorResponse

  alias Tsbank.Customers
  alias Tsbank.Customers.Customer

  action_fallback TsbankWeb.FallbackController

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, :index, users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Users.create_user(user_params),
    {:ok, token, _claims} <- Guardian.encode_and_sign(user),
    {:ok, %Customer{} = _customer}  <- Customers.create_customer(user, user_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", ~p"/api/users/#{user}")
      |> render(:showhata, %{user: user, token: token})
    end
  end


  def sign_in(conn, %{"email" => email, "password" => password}) do
    user_id_by_email =  IO.inspect(Guardian.get_id_on(email))
    user_id = IO.inspect(Guardian.get_me_id(user_id_by_email))
    IO.puts("Doing some debugging")
    IO.inspect(Plug.Conn.put_session(conn, :customer_id, user_id))
    ####
    case Guardian.authenticate(email, password) do
      {:ok, user, token} ->
        conn
        |> Plug.Conn.put_session(:user_id, IO.inspect(user.id))
        |> put_status(:ok)
        |> render(:showhata, %{user: user, token: token})
      {:error, :unauthorized} -> raise ErrorResponse.Unauthorized, message: "Email or Password incorrect."
    end
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    render(conn, :show, user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get_user!(id)

    with {:ok, %User{} = user} <- Users.update_user(user, user_params) do
      render(conn, :show, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user!(id)

    with {:ok, %User{}} <- Users.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
