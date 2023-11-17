defmodule ProductAlphaWeb.BasepriceLive do

    use ProductAlphaWeb, :live_view

    import Ecto.Query, warn: false
    import Ecto.Repo, warn: false

   alias ProductAlpha.Productprice.Baseprice
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
      ll = get_baseprice_id(ref_prodid)
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

          {:ok, _updated_policy} = update_baseprice(ref_prodid, params)
          {:noreply, put_flash(socket, :info, "Success!")}

        {:error, _errors} ->
          {:noreply, put_flash(socket, :error, "Errors!")}
      end
    end

    def update_baseprice(product_id, updated_data) do
      service = get_baseprice_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
      IO.inspect(service)
      |> Ecto.Changeset.change(datab: updated_data)
      |> Repo.update()
    end

    def get_service(product_id) do
      Repo.get(ProductAlpha.Providers.Provider,product_id)
      # hata.data
    end

    def get_baseprice_id(product_id) do
      ProductAlpha.Productprice.Baseprice # our scema file
      |> where(product_id: ^product_id)
      # basically is for returning user data wtogether with account
      |> preload([:product]) # this bcs of the relationship between the two
      |> Repo.one()
    end



    def startbase() do
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
        "title" => "Base Price Set",
        "properties" => %{
            "Base price" => %{
              "properties" => %{
                "billing_code" => %{"type" => "string", "propertyOrder" => 2},
                "default_spend_limit" => %{"type" => "integer", "propertyOrder" => 6},
                "default_text" => %{"type" => "string","propertyOrder" => 3},
                "free_units" => %{"type" => "integer","propertyOrder" => 1},
                "gl_code" => %{"type" => "string", "propertyOrder" => 0},
                "invoicing_mode" => %{"type" => "string","propertyOrder" => 4},
                "post_surcharge" => %{"type" => "integer","propertyOrder" => 5}
              },
              "required" => ["gl_code", "free_units", "billing_code", "default_text", "invoicing_mode",
               "post_surcharge", "default_spend_limit"],
              "type" => "object"
            }
          }
  }



  end





end
