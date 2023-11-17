defmodule ProductAlphaWeb.DefaultrecLive do
  use ProductAlphaWeb, :live_view

  import Ecto.Query, warn: false
  import Ecto.Repo, warn: false

 # alias ProductAlpha.Policies
 # alias ProductAlpha.Policies.Policy

 alias ProductAlpha.Recharge.Defaultrec
 alias ProductAlpha.Repo
 alias ProductAlpha.Products

  def mount(_params, session, socket) do
    ref_schema = schema("GER")
    session_id = session["product_id"]
    sess_pro = session["product"]
    IO.inspect(sess_pro)

    hata = Products.get_product!(session_id)
    IO.inspect(hata.name)
    {:ok, assign(socket,  ref_schema: ref_schema, prod_id: session_id,  prodname: hata.name )}
 end

  def handle_event("load-schema", %{"code" => code}, socket) do
     ko = Jason.encode!(schema(code))
     ref_prodid = IO.inspect(socket.assigns.prod_id)
     ll = get_default_id(ref_prodid)
     IO.inspect(ll.datab)
     #,additional: startwallet()
    {:reply, %{schema: schema(code), defaultdefrec: startdefault()}, socket}
  end


  def handle_event("submit", params, socket) do
    ref_prodid = IO.inspect(socket.assigns.prod_id)
    ref_schema = socket.assigns.ref_schema
    IO.inspect(params)
    IO.inspect(ref_prodid)
    case ExJsonSchema.Validator.validate(ref_schema, params) do
      :ok ->

        {:ok, _updated_policy} = update_defaultrec(ref_prodid, params)
        {:noreply, put_flash(socket, :info, "Success!")}

      {:error, _errors} ->
        {:noreply, put_flash(socket, :error, "Errors!")}
    end
  end
 # "propertyOrder" => 2


 def update_defaultrec(product_id, updated_data) do
  service = get_default_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
  IO.inspect(service)
  |> Ecto.Changeset.change(datab: updated_data)
  |> Repo.update()
end


def get_service(product_id) do
  Repo.get(ProductAlpha.Providers.Provider,product_id)
  # hata.data
end


def get_default_id(product_id) do
  ProductAlpha.Recharge.Defaultrec # our scema file
  |> where(product_id: ^product_id)
  # basically is for returning user data wtogether with account
  |> preload([:product]) # this bcs of the relationship between the two
  |> Repo.one()
end





  def startdefault() do
    %{



        "Default" => %{
          "data_topup_notification" => "data_topup_confirmation",
          "default_data_wallet" => "data0",
          "default_sms_wallet" => "sms0",
          "default_unit_rate" => 1,
          "default_voice_wallet" => "voice0",
          "default_wallet" => "primary",
          "sms_topup_notification" => "sms_topup_confirmation",
          "voice_topup_notification" => "voice_topup_confirmation"
        }





    }
  end
  defp schema("GER") do
  # You'd probably load the schema from either your database
  # or a JSON file, but we'll simply hard-code it for now:
    %{
      "type" => "object",
      "title" => "Default Recharge S",
      "properties" => %{
          "Default" => %{
            "properties" => %{
              "data_topup_notification" => %{"type" => "string", "propertyOrder" => 6},
              "default_data_wallet" => %{"type" => "string", "propertyOrder" => 3},
              "default_sms_wallet" => %{"type" => "string", "propertyOrder" => 2},
              "default_unit_rate" => %{"type" => "integer", "propertyOrder" => 1},
              "default_voice_wallet" => %{"type" => "string","propertyOrder" => 4},
              "default_wallet" => %{"type" => "string", "propertyOrder" => 0},
              "sms_topup_notification" => %{"type" => "string", "propertyOrder" => 5},
              "voice_topup_notification" => %{"type" => "string", "propertyOrder" => 7}
            },
            "required" => ["default_wallet", "default_unit_rate", "default_sms_wallet",
             "default_data_wallet", "default_voice_wallet", "sms_topup_notification",
             "data_topup_notification", "voice_topup_notification"],
            "type" => "object"
          }



        }
}



end
end
