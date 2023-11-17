defmodule ProductAlphaWeb.SubscriptionbillLive do
  use ProductAlphaWeb, :live_view



  import Ecto.Query, warn: false
  import Ecto.Repo, warn: false

 alias ProductAlpha.Productprice.Subscription
 alias ProductAlpha.Repo
 alias ProductAlpha.Products

  def mount(_params, session, socket) do
    ref_schema = schema("GER")
    session_id = session["product_id"]
    sess_pro = session["product"]
    IO.inspect(sess_pro)

    hata = Products.get_product!(session_id)
    IO.inspect(hata.name)

    {:ok, assign(socket, ref_schema: ref_schema, prod_id: session_id, prodname: hata.name)}
 end

  def handle_event("load-schema", %{"code" => code}, socket) do
    ref_prodid = IO.inspect(socket.assigns.prod_id)
    ko = Jason.encode!(schema(code))
    ll = get_subscription_id(ref_prodid)
    IO.inspect(ll.datab)
     #,additional: startwallet()
    {:reply, %{schema: schema(code)}, socket}
  end


  def handle_event("submit", params, socket) do
    ref_prodid = IO.inspect(socket.assigns.prod_id)
    ref_schema = socket.assigns.ref_schema
    IO.inspect(params)

    case ExJsonSchema.Validator.validate(ref_schema, params) do
      :ok ->

        {:ok, _updated_policy} = update_subscription(ref_prodid, params)
        {:noreply, put_flash(socket, :info, "Success!")}

      {:error, _errors} ->
        {:noreply, put_flash(socket, :error, "Errors!")}
    end
  end

  def update_subscription(product_id, updated_data) do
    service = get_subscription_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
    IO.inspect(service)
    |> Ecto.Changeset.change(datab: updated_data)
    |> Repo.update()
  end

  def get_service(product_id) do
    Repo.get(ProductAlpha.Providers.Provider,product_id)
    # hata.data
  end

  def get_subscription_id(product_id) do
    ProductAlpha.Productprice.Subscription # our scema file
    |> where(product_id: ^product_id)
    # basically is for returning user data wtogether with account
    |> preload([:product]) # this bcs of the relationship between the two
    |> Repo.one()
  end


  def startsubcri() do
    %{

        "Inter-account transfer specification" => %{
          "allowed_services" => ["data", "voice", "sms", "primary"],
          "data" => %{"default_wallet" => "data0", "enabled_wallets" => ["data0"]},
          "destination" => true,
          "enabled" => true,
          "policy_name" => "MASTER_POLICY",
          "primary" => %{"default_wallet" => "primary", "enabled_wallets" => ["primary"]},
          "sms" => %{"default_wallet" => "sms0", "enabled_wallets" => ["sms0"]},
          "source" => true,
          "valid_dst_policy_statuses" => ["High Speed"],
          "valid_dst_service_statuses" => [0],
          "valid_src_policy_statuses" => ["High Speed"],
          "valid_src_service_statuses" => [0],
          "voice" => %{"default_wallet" => "voice0", "enabled_wallets" => ["voice0"]}

      }



    }
  end
  defp schema("GER") do
  # You'd probably load the schema from either your database
  # or a JSON file, but we'll simply hard-code it for now:
    %{
      "type" => "object",
      "title" => "Subscription Set",
      "properties" => %{
          "Subscription billing" => %{
            "items" => %{
              "properties" => %{
                "amount" => %{"format" => "time", "type" => "string"},
                "fee" => %{"format" => "time", "type" => "string"},
                "status" => %{"type" => "string"}
              },
              "required" => ["fee", "amount", "status"],
              "type" => "object"
            },
            "type" => "array"
          }
        }
}



end
end
