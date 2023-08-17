defmodule RealDealApiWeb.DafaultController do
  use RealDealApiWeb, :controller

  def index(conn, _params) do
    text conn, "The Real Deal API Is LIVE - #{Mix.env()}"
  end

end
