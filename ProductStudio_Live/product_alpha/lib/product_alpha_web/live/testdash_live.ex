defmodule ProductAlphaWeb.TestdashLive do
  use ProductAlphaWeb, :live_view

  import Ecto.Query, warn: false
  import Ecto.Repo, warn: false

 alias ProductAlpha.Policies.Threshold
 alias ProductAlpha.Repo

  def mount(_params, session, socket) do
    # ref_schema = schema("GER")
    # session_id = session["product_id"]
    sess_pro = "hhj"
    # IO.inspect(sess_pro)

    {:ok, assign(socket,  prod_id: sess_pro )}
 end
end
