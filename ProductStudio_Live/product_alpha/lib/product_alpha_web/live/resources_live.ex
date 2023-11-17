defmodule ProductAlphaWeb.ResourcesLive do
  use ProductAlphaWeb, :live_view


  import Ecto.Query, warn: false
  import Ecto.Repo, warn: false

 alias ProductAlpha.Network.Resource
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
    ll = get_resource_id(ref_prodid)
    IO.inspect(ll.datab)
    # #IO.inspect(get_policy(3))
    # ll = get_policy(3)
    # ll.data
    {:reply, %{schema: schema(code), resdev: startresourcesdev()}, socket}
  end


  def handle_event("submit", params, socket) do
    ref_prodid = IO.inspect(socket.assigns.prod_id)
    ref_schema = socket.assigns.ref_schema
    IO.inspect(params)

    case ExJsonSchema.Validator.validate(ref_schema, params) do
      :ok ->

        {:ok, _updated_policy} = update_resource(ref_prodid, params)
        {:noreply, put_flash(socket, :info, "Success!")}

      {:error, _errors} ->
        {:noreply, put_flash(socket, :error, "Errors!")}
    end
  end



  def update_resource(product_id, updated_data) do
    service = get_resource_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
    IO.inspect(service)
    |> Ecto.Changeset.change(datab: updated_data)
    |> Repo.update()
  end

  def get_service(product_id) do
    Repo.get(ProductAlpha.Providers.Provider,product_id)
    # hata.data
  end

  def get_resource_id(product_id) do
    ProductAlpha.Network.Resource # our scema file
    |> where(product_id: ^product_id)
    # basically is for returning user data wtogether with account
    |> preload([:product]) # this bcs of the relationship between the two
    |> Repo.one()
  end



  def startresourcesdev() do
    %{
      "Resources" => %{
        "Logical Resource" => [
          %{
            "isOperational" => "true",
            "irStatus" => "initializing",
            "serviceState" => "In service"
          }
        ],
        "Physical Resource" => [
          %{
            "ManufactureDate" => "2012-07-29",
            "otherIdentifier" => "10927476745",
            "PowerState" => "Full power applied",
            "serial number" => "98348937859355",
            "version number" => "version 17.5"
          }
        ],
        "Device" => [
          %{
            "type" => "mobile",
            "manufacturer" => "rain",
            "model" => "smartphone"
          }
        ]
      }
    }
  end
  defp schema("GER") do
  # You'd probably load the schema from either your database
  # or a JSON file, but we'll simply hard-code it for now:
    %{
      "type" => "object",
      "title" => "Resources & Device",
      "properties" => %{
      "Resources" => %{
          "type" => "object",
          "properties" => %{
            "Logical Resource" => %{
              "type" => "array",
              "propertyOrder" => 0,
              "items" => %{
                "type" => "object",
                "properties" => %{
                  "isOperational" => %{
                    "type" => "string",
                    "propertyOrder" => 0
                  },
                  "irStatus" => %{
                    "type" => "string",
                    "propertyOrder" => 1
                  },
                  "serviceState" => %{
                    "type" => "string",
                    "propertyOrder" => 2
                  }
                },
                "required" => [
                  "isOperational",
                  "irStatus",
                  "serviceState"
                ]
              }
            },
            "Physical Resource" => %{
              "type"  => "array",
              "propertyOrder" => 1,
              "items" => %{
                "type" => "object",
                "properties" => %{
                  "ManufactureDate" => %{
                    "type" => "string",
                    "format" => "date",
                    "propertyOrder" => 0
                  },
                  "otherIdentifier" => %{
                    "type" => "string",
                    "propertyOrder" => 2
                  },
                  "PowerState" => %{
                    "type" => "string",
                    "propertyOrder" => 1
                  },
                  "serial number" => %{
                    "type"  => "string",
                    "propertyOrder" => 3
                  },
                  "version number" => %{
                    "type" => "string",
                    "propertyOrder" => 4
                  }
                },
                "required" => [
                  "ManufactureDate",
                  "otherIdentifier",
                  "PowerState",
                  "serial number",
                  "version number"
                ]
              }
            },
            "Device" => %{
              "type" => "array",
              "propertyOrder" => 2,
              "items" => %{
                "type" => "object",
                "properties" => %{
                  "type" => %{
                    "type" => "string",
                    "propertyOrder" => 2
                  },
                  "manufacturer" => %{
                    "type" =>  "string",
                    "propertyOrder" => 0
                  },
                  "model" => %{
                    "type" => "string",
                    "propertyOrder" => 1
                  }
                },
                "required" => [
                  "type",
                  "manufacturer",
                  "model"
                ]
              }
            }
          },
          "required" => [
            "Logical Resource",
            "Physical Resource",
            "Device"
          ]
        }
}
}



end

end
