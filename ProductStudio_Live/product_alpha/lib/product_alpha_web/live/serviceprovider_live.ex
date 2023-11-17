defmodule ProductAlphaWeb.ServiceproviderLive do
    use ProductAlphaWeb, :live_view

     import Ecto.Query, warn: false
     import Ecto.Repo, warn: false

    # alias ProductAlpha.Policies
    # alias ProductAlpha.Policies.Policy
    alias ProductAlpha.Products
    alias ProductAlpha.Providers.Provider
    alias ProductAlpha.Repo

    def mount(_params, session, socket) do
      ref_schema = schema("GER")
      session_id = session["product_id"]
      sess_pro = session["product"]
      IO.inspect(sess_pro)

      hata = Products.get_product!(session_id)
      IO.inspect(hata.name)
      # IO.puts("THE SESION BELOW")
      # IO.inspect(session_id)
      {:ok, assign(socket, ref_schema: ref_schema, prod_id: session_id, prodname: hata.name )}
   end

    def handle_event("load-schema", %{"code" => code}, socket) do
      # ko = Jason.encode!(darastart())
      # #IO.inspect(get_policy(3))
       ref_prodid = IO.inspect(socket.assigns.prod_id)
       ll = get_account_by_number(ref_prodid)
       IO.inspect(ll.datab)
      #socket.assigns.prod_id
      # startprovider() for default values
      {:reply, %{schema: schema(code), spdefault: ll.datab}, socket}
    end


    def handle_event("submit", params, socket) do\
      ref_prodid = IO.inspect(socket.assigns.prod_id)
      ref_schema = socket.assigns.ref_schema
      IO.inspect(params)
      IO.inspect(ref_prodid)
      case ExJsonSchema.Validator.validate(ref_schema, params) do
        :ok ->
          {:ok, _updated_policy} = update_service(ref_prodid, params)
          {:noreply, put_flash(socket, :info, "Success!")}
          {:noreply, redirect(socket, to: "/j/sp")}

        {:error, _errors} ->
          {:noreply, put_flash(socket, :error, "Errors!")}
      end
    end





  def update_service(product_id, updated_data) do
    service = get_account_by_number(product_id)
 # Use get_policy!/1 to raise an error if the policy is not found
    IO.inspect(service)
    |> Ecto.Changeset.change(datab: updated_data)
    |> Repo.update()
  end


  # defp insert_policy12(data) do
  #   %ProductAlpha.Policies.Policy{} # Change to match your schema module
  #   |> Ecto.Changeset.change(data: data)
  #   |> Repo.insert()
  # end


  def get_service(product_id) do
    Repo.get(ProductAlpha.Providers.Provider,product_id)
    # hata.data
  end


  def get_account_by_number(product_id) do
    ProductAlpha.Providers.Provider # our scema file
    |> where(product_id: ^product_id)
    # basically is for returning user data wtogether with account
    |> preload([:product]) # this bcs of the relationship between the two
    |> Repo.one()
  end



    # defp insert_policy(params) do
    #   # Define the data to be inserted as a map
    #   data = %{"params" => params}

    #   # Insert the data into the database
    #   Repo.insert(%Policy{data: data})
    # end


    # def update_policy(id, updated_data) do
    #   policy = get_policy(id) # Use get_policy!/1 to raise an error if the policy is not found
    #   IO.inspect(policy)
    #   |> Ecto.Changeset.change(data: updated_data)
    #   |> Repo.update()
    # end


    # defp insert_policy12(data) do
    #   %ProductAlpha.Policies.Policy{} # Change to match your schema module
    #   |> Ecto.Changeset.change(data: data)
    #   |> Repo.insert()
    # end

    # @spec get_policy(any) :: any
    # def get_policy(id) do
    #   Repo.get(ProductAlpha.Policies.Policy, id)
    #   # hata.data
    # end


    defp darastart() do
      %{
             "Policies" => %{
             "triggers" => [
               %{
                 "triggerType" => "QUOTA_THRESHOLD",
                 "triggerCategory" => "IMMEDIATE_REPORT"
               },
               %{
                 "triggerType" => "QUOTA_EXHAUSTED",
                 "triggerCategory" => "IMMEDIATE_REPORT"
               },
               %{
                 "triggerType" => "QHT",
                 "triggerCategory" => "IMMEDIATE_REPORT"
               },
               %{
                 "triggerType" => "VALIDITY_TIME",
                 "triggerCategory" => "IMMEDIATE_REPORT"
               }
             ],
             "validityTime" => 900,
             "quotaHoldingTime" => 0,
             "timeQuotaThreshold" => 70,
             "unitQuotaThreshold" => 80,
             "policy_states" => [
               "High Speed",
               "RICA",
               "Device",
               "PP_OOB"
             ],
             "initial_service_policy" => %{
               "MASTER_POLICY" => %{
                 "currentStatus" => "High Speed"
               }
             }
            }
           }

    end

    def startprovider() do
      %{
        "Service Provider" => [
            %{
              "name" => "rain",
              "address" => "Block D, The Main Straight, 392 Main Rd, Bryanston, Johannesburg, 2191",
              "contact details" => "0816101000"
            }
          ]

      }
    end
    defp schema("GER") do
    # You'd probably load the schema from either your database
    # or a JSON file, but we'll simply hard-code it for now:
      %{
        "type" => "object",
        "title" => "Service Provider",
        "properties" => %{
        "Service Provider" => %{
          "type" => "array",


          "items" => %{
            "type" => "object",
            "title" => "Provider",
            "properties" => %{
              "name" => %{
                "type" => "string",
                "propertyOrder" => 0
              },
              "address" => %{
                "type" => "string",
                "propertyOrder" => 1
              },
              "contact details" => %{
                "type" => "string",
                "propertyOrder" => 2
              }
            },
            "required" => [
              "name",
              "address",
              "contact details"
            ]
          }

    }
  }
  }



  end


end
