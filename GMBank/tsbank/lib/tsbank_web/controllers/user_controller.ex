defmodule TsbankWeb.UserController do
  @moduledoc """
  This module is responsible for creating and managing user-related actions in the Tsbank application.

  It provides endpoints for creating and managing both regular users and administrators.
  """

  use TsbankWeb, :controller

  alias Tsbank.Users
  alias Tsbank.Users.User

  alias TsbankWeb.Auth.Guardian
  alias TsbankWeb.Auth.ErrorResponse

  alias Tsbank.Customers
  alias Tsbank.Customers.Customer

  alias Tsbank.Admins
  alias Tsbank.Admins.Admin

  action_fallback TsbankWeb.FallbackController


  @doc """
  Get a list of users.

  This function retrieves a list of all users and renders them in the 'index' view.

  ## Params

  - `conn`: The connection struct
  - `_params`: Unused parameters

  ## Returns

  - `conn`: The connection struct
  """

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, :index, users: users)
  end

  @doc """
  Create a user and link them to a customer.

  This function handles the creation of a user, signing them in, and associating them with a customer.

  ## Params

  - `conn`: The connection struct
  - `user_params`: A map containing user parameters

  ## Returns

  - `conn`: The connection struct
  """

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Users.create_user(user_params),
    {:ok, token, _claims} <- Guardian.encode_and_sign(user),
    {:ok, %Customer{} = _customer}  <- Customers.create_customer(user, user_params) do
      conn
      |> put_status(:created)
      |> render(:showD, %{user: user, token: token})
    end
  end

  @doc """
  Create an admin user.

  This function handles the creation of an administrator user and signing them in.

  ## Params

  - `conn`: The connection struct
  - `user_params`: A map containing user parameters

  ## Returns

  - `conn`: The connection struct
  """

  ##################Create Admin###################################
  def create_admin(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Users.create_user(user_params),
    {:ok, token, _claims} <- Guardian.encode_and_sign(user),
    {:ok, %Admin{} = _admin}  <- Admins.create_admin(user, user_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", ~p"/api/users/#{user}")
      |> render(:showD, %{user: user, token: token})
    end
  end

  @doc """
  Authenticate and log in an administrator.

  This function handles the authentication and login of an administrator.

  ## Params

  - `conn`: The connection struct
  - `email`: The administrator's email
  - `password`: The administrator's password

  ## Returns

  - `conn`: The connection struct
  """

  ############################Admin Login##################################

  def admin_login(conn,%{"email" => email, "password" => password}) do
    user_email =  get_user_email(email)
    user_id = get_admin_id(user_email)

    case Guardian.authenticate(email, password) do
      {:ok, user, token} ->
        conn
        |> Plug.Conn.put_session(:admin_id, IO.inspect(user.admin))
        |> put_status(:ok)
        |> render(:showD, %{user: user, token: token})
      {:error, :unauthorized} -> raise ErrorResponse.Unauthorized, message: "Email or Password incorrect."
    end
  end



  def sign_in(conn, %{"email" => email, "password" => password}) do
    user_id_by_email =  IO.inspect(Guardian.get_id_on(email))
    user_id = IO.inspect(Guardian.get_me_id(user_id_by_email))
    IO.puts("Debug")
    IO.inspect(Plug.Conn.put_session(conn, :customer_id, user_id))
    ####
    case Guardian.authenticate(email, password) do
      {:ok, user, token} ->
        conn
        |> Plug.Conn.put_session(:user_id, IO.inspect(user.id))
        |> put_status(:ok)
        |> render(:showD, %{user: user, token: token})
      {:error, :unauthorized} -> raise ErrorResponse.Unauthorized, message: "Email or Password incorrect."
    end
  end

  defp get_user_email (email) do
    case Users.get_user_by_email(email) do
      nil -> {:error, :unauthorized}
      user -> user.id
    end
  end

  defp get_admin_id(id) do
    case Users.get_full_Admin(id) do
      nil -> {:error, :unauthorized}
      admin -> admin.id
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
