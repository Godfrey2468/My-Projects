defmodule ProductAlphaWeb.ThresholdLive do
  use ProductAlphaWeb, :live_view

  import Ecto.Query, warn: false
  import Ecto.Repo, warn: false

 alias ProductAlpha.Policies.Threshold
 alias ProductAlpha.Repo
 alias ProductAlpha.Products

  def mount(_params, session, socket) do
    ref_schema = schema("GER")
    session_id = session["product_id"]
    sess_pro = session["product"]
    IO.inspect(sess_pro)

    hata = Products.get_product!(session_id)
    IO.inspect(hata.name)
    {:ok, assign(socket, ref_schema: ref_schema, prod_id: session_id , prodname: hata.name)}
 end

  def handle_event("load-schema", %{"code" => code}, socket) do
    ref_prodid = IO.inspect(socket.assigns.prod_id)
     ko = Jason.encode!(schema(code))
     ll = get_threshold_id(ref_prodid)
     IO.inspect(ll.datab)
     #,additional: startwallet()
     #  triggersdef: startvoice()
    {:reply, %{schema: schema(code), thresholddef: ll.datab}, socket}
  end


  def handle_event("submit", params, socket) do
    ref_prodid = IO.inspect(socket.assigns.prod_id)
    ref_schema = socket.assigns.ref_schema
    IO.inspect(params)

    case ExJsonSchema.Validator.validate(ref_schema, params) do
      :ok ->

        {:ok, _updated_policy} = update_thresholdpolicy(ref_prodid, params)
        {:noreply, put_flash(socket, :info, "Success!")}

      {:error, _errors} ->
        {:noreply, put_flash(socket, :error, "Errors!")}
    end
  end

  def update_thresholdpolicy(product_id, updated_data) do
    service = get_threshold_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
    IO.inspect(service)
    |> Ecto.Changeset.change(datab: updated_data)
    |> Repo.update()
  end

  def get_service(product_id) do
    Repo.get(ProductAlpha.Providers.Provider,product_id)
    # hata.data
  end

  def get_threshold_id(product_id) do
    ProductAlpha.Policies.Threshold # our scema file
    |> where(product_id: ^product_id)
    # basically is for returning user data wtogether with account
    |> preload([:product]) # this bcs of the relationship between the two
    |> Repo.one()
  end

 # "propertyOrder" => 2

  def startthres() do
    %{

        "threshold" => %{
          "quotaHoldingTime" => 0,
          "timeQuotaThreshold" => 70,
          "unitQuotaThreshold" => 80,
          "validityTime" => 900
        }

    }
  end
  defp schema("GER") do
  # You'd probably load the schema from either your database
  # or a JSON file, but we'll simply hard-code it for now:
    %{
      "type" => "object",
      "title" => "Thresholds",
      "properties" => %{
          "threshold" => %{
            "properties" => %{
              "quotaHoldingTime" => %{"type" => "integer", "propertyOrder" => 1},
              "timeQuotaThreshold" => %{"type" => "integer", "propertyOrder" => 2},
              "unitQuotaThreshold" => %{"type" => "integer", "propertyOrder" => 3},
              "validityTime" => %{"type" => "integer","propertyOrder" => 0}
            },
            "required" => ["validityTime", "quotaHoldingTime", "timeQuotaThreshold", "unitQuotaThreshold"],
            "type" => "object"
          }

        }
}



end

end
