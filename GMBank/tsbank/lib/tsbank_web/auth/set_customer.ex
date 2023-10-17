defmodule TsbankWeb.Auth.SetCustomer do
  import Plug.Conn
  alias TsbankWeb.Auth.ErrorResponse

  alias Tsbank.Customers

  def init(_options) do

  end

  def call(conn, _options) do
    if conn.assigns[:customer] do
      conn
    else
     IO.inspect(customer_id = get_session(conn, :customer_id))

      if customer_id == nil, do: raise ErrorResponse.Unauthorized

      customer = Customers.get_full_customer(customer_id)
      cond do
       customer_id && customer -> assign(conn, :customer, customer)
        true -> assign(conn, :customer, nil)
      end
    end
  end
end
