defmodule ProductAlphaWeb.Auth.SetProduct do
  import Plug.Conn
  # alias TsbankWeb.Auth.ErrorResponse
  import Phoenix.Controller
   alias ProductAlpha.{Repo, Product}
   alias ProductAlpha.Products
  # alias Tsbank.Users

  def init(_options) do

  end

  def call(conn, _options) do
    if conn.assigns[:product] do
      conn
    else
      product_id = get_session(conn, :product_id)

      if product_id == nil do
        conn
        |> put_status(401)
        |> put_flash(:error, "You must be logged in!")
        |> halt

      else
        product = Products.get_product!(product_id)
        cond do
          product_id && product -> assign(conn, :product, product)
          true -> assign(conn, :product, nil)
        end
      end
     # , do: raise ErrorResponse.Unauthorized


    end
  end

  # def call(conn, _options) do
  #   if conn.assigns[:product] do
  #     conn
  #   else
  #     product_id = get_session(conn, :product_id)
  #     if product_id == nil, do: raise ErrorResponse.Unauthorized
  #     product = Users.get_full_user(user_id)
  #     cond do
  #       user_id && user -> assign(conn, :user, user)
  #       true -> assign(conn, :user, nil)
  #     end
  #   end
  # end


# defmodule MyApp.Plug.Authenticate do
#   import Plug.Conn
#   import Phoenix.Controller
#   alias MyApp.{Repo, User}
#   def init(opts), do: opts


# was using this one

  # def call(conn, _options) do
  #   if product = get_product(conn) do
  #     assign(conn, :current_product, product)
  #   else
  #     conn
  #     |> put_status(401)
  #     |> put_flash(:error, "You must be logged in!")
  #     |> halt
  #   end
  # end
  # def get_product(conn) do
  #   case conn.assigns[:current_product] do
  #     nil ->
  #       case IO.inspect(get_session(conn, :product_id)) do
  #         product_id -> Products.get_product!(product_id)
  #         nil -> nil
  #       end
  #     product -> product
  #   end
  # end
  # defp fetch_product(id), do: Repo.get!(Product, id)
# end



# r authentication plug.

# defmodule MyApp.Plug.Authenticate do
#   import Plug.Conn
#   import Phoenix.Controller
#   alias MyApp.{Repo, User}
#   def init(opts), do: opts
#   def call(conn, _opts) do
#     if user = get_user(conn) do
#       assign(conn, :current_user, user)
#     else
#       conn
#       |> put_status(401)
#       |> put_flash(:error, "You must be logged in!")
#       |> halt
#     end
#   end
#   def get_user(conn) do
#     case conn.assigns[:current_user] do
#       nil ->
#         case get_session(conn, :user_id) do
#           id -> fetch_user(id)
#           nil -> nil
#         end
#       user -> user
#     end
#   end
#   defp fetch_user(id), do: Repo.get!(User, id)
# end
end
