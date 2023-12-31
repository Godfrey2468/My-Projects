defmodule RealDealApi.Auth.GuardianErrorHandler do
  import Plug.Conn

  def auth_error(conn, {type, _reason}, _opts) do
    body = Jason.encode!(%{error: to_string(type)})
    conn
    |> put_resp_content_type("application/jason")
    |> send_resp(401, body)
  end
end
