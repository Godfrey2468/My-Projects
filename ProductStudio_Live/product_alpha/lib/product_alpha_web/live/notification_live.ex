defmodule ProductAlphaWeb.NotificationLive do
  use ProductAlphaWeb, :live_view



  import Ecto.Query, warn: false
  import Ecto.Repo, warn: false

 alias ProductAlpha.Network.Notification
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
    ll = get_notification_id(ref_prodid)
    IO.inspect(ll.datab)
    # #IO.inspect(get_policy(3))
    # ll = get_policy(3)
    # ll.data
    {:reply, %{schema: schema(code), networknotification: startnotification()}, socket}
  end


  def handle_event("submit", params, socket) do
    ref_prodid = IO.inspect(socket.assigns.prod_id)
    ref_schema = socket.assigns.ref_schema
    IO.inspect(params)

    case ExJsonSchema.Validator.validate(ref_schema, params) do
      :ok ->

        {:ok, _updated_policy} = update_notification(ref_prodid, params)
        {:noreply, put_flash(socket, :info, "Success!")}

      {:error, _errors} ->
        {:noreply, put_flash(socket, :error, "Errors!")}
    end
  end


  def update_notification(product_id, updated_data) do
    service = get_notification_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
    IO.inspect(service)
    |> Ecto.Changeset.change(datab: updated_data)
    |> Repo.update()
  end

  def get_service(product_id) do
    Repo.get(ProductAlpha.Providers.Provider,product_id)
    # hata.data
  end

  def get_notification_id(product_id) do
    ProductAlpha.Network.Notification  # our scema file
    |> where(product_id: ^product_id)
    # basically is for returning user data wtogether with account
    |> preload([:product]) # this bcs of the relationship between the two
    |> Repo.one()
  end




  def startnotification() do
    %{
      "Notification" => %{
        "default_quota" => %{
          "name" => "totalVolume",
          "quota" => 268_435_456
        },
        "xxxfinal_unit" => %{
          "finalUnitIndication" => %{
            "finalUnitAction" => "TERMINATE"
          }
        },
        "threshold_notifications" => [
          %{
            "p" => 99.999,
            "name" => "4g_basic_100p",
            "type" => "SMS"
          },
          %{
            "p" => 80,
            "name" => "4g_basic_80p",
            "type" => "SMS"
          },
          %{
            "p" => 50,
            "name" => "4g_basic_50p",
            "type" => "SMS"
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
      "title" => "Network Resource",
      "properties" => %{
      "Notification" => %{
          "type" => "object",
          "properties" => %{
            "default_quota" => %{
              "type" => "object",
              "propertyOrder" => 0,
              "properties" => %{
                "name" => %{
                  "type" => "string"
                },
                "quota" => %{
                  "type" => "integer"
                }
              },
              "required" => [
                "name",
                "quota"
              ]
            },
            "xxxfinal_unit" => %{
              "type" => "object",
              "propertyOrder" => 1,
              "properties" => %{
                "finalUnitIndication" => %{
                  "type" => "object",
                  "properties" => %{
                    "finalUnitAction" => %{
                      "type" => "string"
                    }
                  },
                  "required" => [
                    "finalUnitAction"
                  ]
                }
              },
              "required" => [
                "finalUnitIndication"
              ]
            },
            "threshold_notifications" => %{
              "type" => "array",
              "propertyOrder" => 2,
              "items" => %{
                "type" => "object",
                "properties" => %{
                  "p" => %{
                    "type" => "number"
                  },
                  "name" => %{
                    "type" => "string"
                  },
                  "type" => %{
                    "type" => "string"
                  }
                },
                "required" => [
                  "p",
                  "name",
                  "type"
                ]
              }
            }
          },
          "required" => [
            "default_quota",
            "xxxfinal_unit",
            "threshold_notifications"
          ]
        }
}
}



end

end
