defmodule ProductAlphaWeb.SpecificationLive do
  use ProductAlphaWeb, :live_view

  import Ecto.Query, warn: false
  import Ecto.Repo, warn: false

 alias ProductAlpha.Products
 alias ProductAlpha.Network.Specification
 alias ProductAlpha.Repo
 alias ProductAlphaWeb.JsonLive


  def mount(_params, session, socket) do
    ref_schema = schema("GER")
    session_id = session["product_id"]
    sess_pro = session["product"]
    IO.inspect(sess_pro)

    hata = Products.get_product!(session_id)
    IO.inspect(hata.name)
    {:ok, assign(socket, ref_schema: ref_schema, prod_id: session_id, prodname: hata.name )}
 end

  def handle_event("load-schema", %{"code" => code}, socket) do
    ref_prodid = IO.inspect(socket.assigns.prod_id)
    ko = Jason.encode!(schema(code))
    ll = get_specification_id(ref_prodid)
    IO.inspect(ll.datab)
    # #IO.inspect(get_policy(3))
    # ll = get_policy(3)
    # ll.data
    {:reply, %{schema: schema(code), networkrespec: startnetworkspec()}, socket}
  end


  def handle_event("submit", params, socket) do
    ref_prodid = IO.inspect(socket.assigns.prod_id)
    ref_schema = socket.assigns.ref_schema
    #IO.inspect(params)
    {:ok, hfhf} = JsonLive.network_service(params)
        IO.inspect(hfhf)

    case ExJsonSchema.Validator.validate(ref_schema, params) do
      :ok ->

        {:ok, _updated_policy} = update_specification(ref_prodid, params)
        {:noreply, put_flash(socket, :info, "Success!")}

      {:error, _errors} ->

        {:noreply, put_flash(socket, :error, "Errors!")}
    end
  end




  def update_specification(product_id, updated_data) do
    service = get_specification_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
    IO.inspect(service)
    |> Ecto.Changeset.change(datab: updated_data)
    |> Repo.update()
  end

  def get_service(product_id) do
    Repo.get(ProductAlpha.Providers.Provider,product_id)
    # hata.data
  end

  def get_specification_id(product_id) do
    ProductAlpha.Network.Specification # our scema file
    |> where(product_id: ^product_id)
    # basically is for returning user data wtogether with account
    |> preload([:product]) # this bcs of the relationship between the two
    |> Repo.one()
  end


  def startnetworkspec() do
    %{
      "Specification" => %{
        "cc" => "27",
        "ims" => "8000",
        "mcc" => "655",
        "mnc" => "74",
        "ndc" => "696",
        "tpl" => "12",
        "vobb" => true,
        "hlrsn" => "1",
        "sicap" => true,
        "access" => "4G",
        "simota" => "4001",
        "srvName" => "4G_STAFF_MOBILE",
        "usrState" => "1",
        "ims_voice" => false,
        "snPatterns" => "99",
        "usrExAttr1" => "0",
        "vobb_realm" => "rainmobile.co.za",
        "ims_srvName" => "VOLTE_RAIN_PREMIUM",
        "ims_template" => "ADD_VOLTE_MSR_SUP",
        "usrIdentifier" => "usrMSISDN",
        "usrSubNetType" => "0",
        "password_prefix" => "",
        "password_suffix" => "@raIn",
        "simota_base_url" => "https://api.devops.rain.co.za",
        "ims_pgw_endpoint" => "10.192.21.146:8080/spg",
        "srvStartDateTime" => "CURRENT_DATETIME (GMT+2)",
        "usrBillCycleDate" => "1",
        "password_gen_method" => "Method1",
        "ims_pgw_endpoint_pass" => "cnp200@HW",
        "ims_pgw_endpoint_user" => "BSS_User",
        "network_service_names" => "4G mobile standard staff",
        "vqt_percentage" => 0.5
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
      "Specification" => %{
          "type" => "object",
          "properties" => %{
            "cc" => %{
              "type" => "string",
              "propertyOrder" => 0
            },
            "ims" => %{
              "type" => "string",

              "propertyOrder" => 1
            },
            "mcc" => %{
              "type" => "string",
              "propertyOrder" => 2
            },
            "mnc" => %{
              "type" => "string",
              "propertyOrder" => 3
            },
            "ndc" => %{
              "type" => "string",
              "propertyOrder" => 4
            },
            "tpl" => %{
              "type" => "string",
              "propertyOrder" => 5
            },
            "vobb" => %{
              "type" => "boolean",
              "propertyOrder" => 6
            },
            "hlrsn" => %{
              "type" => "string",
              "propertyOrder" => 7
            },
            "sicap" => %{
              "type" => "boolean",
              "propertyOrder" => 8
            },
            "access" => %{
              "type" => "string",
              "propertyOrder" => 9
            },
            "simota" => %{
              "type" => "string",
              "format" => "time",
              "propertyOrder" => 10
            },
            "srvName" => %{
              "type" => "string",
              "propertyOrder" => 11
            },
            "usrState" => %{
              "type" => "string",
              "propertyOrder" => 12

            },
            "ims_voice" => %{
              "type" => "boolean",
              "propertyOrder" => 13
            },
            "snPatterns" => %{
              "type" => "string",
              "propertyOrder" => 14
            },
            "usrExAttr1" => %{
              "type" => "string",
              "propertyOrder" => 15
            },
            "vobb_realm" => %{
              "type" => "string",
              "propertyOrder" => 16
            },
            "ims_srvName" => %{
              "type" => "string",
              "propertyOrder" => 17
            },
            "ims_template" => %{
              "type" => "string",
              "propertyOrder" => 18
            },
            "usrIdentifier" => %{
              "type" => "string",
              "propertyOrder" => 19
            },
            "usrSubNetType" => %{
              "type" => "string",
              "propertyOrder" => 20
            },
            "password_prefix" => %{
              "type" => "string",
              "propertyOrder" => 21
            },
            "password_suffix" => %{
              "type" => "string",
              "propertyOrder" => 22
            },
            "simota_base_url" => %{
              "type" => "string",
              "format" => "uri",
              "propertyOrder" => 23
            },
            "ims_pgw_endpoint" => %{
              "type" => "string",
              "propertyOrder" => 24
            },
            "srvStartDateTime" => %{
              "type" => "string",
              "propertyOrder" => 25
            },
            "usrBillCycleDate" => %{
              "type" => "string",
              "propertyOrder" => 26
            },
            "password_gen_method" => %{
              "type" =>  "string",
              "propertyOrder" => 27
            },
            "ims_pgw_endpoint_pass" => %{
              "type" => "string",
              "propertyOrder" => 28
            },
            "ims_pgw_endpoint_user" => %{
              "type" => "string",
              "propertyOrder" => 29
            },
            "network_service_names" => %{
              "type" => "string",
              "propertyOrder" => 30
            },
            "vqt_percentage" => %{
              "type" => "number",
              "propertyOrder" => 31

            }
          },
          "required" => [
            "cc",
            "ims",
            "mcc",
            "mnc",
            "ndc",
            "tpl",
            "vobb",
            "hlrsn",
            "sicap",
            "access",
            "simota",
            "srvName",
            "usrState",
            "ims_voice",
            "snPatterns",
            "usrExAttr1",
            "vobb_realm",
            "ims_srvName",
            "ims_template",
            "usrIdentifier",
            "usrSubNetType",
            "password_prefix",
            "password_suffix",
            "simota_base_url",
            "ims_pgw_endpoint",
            "srvStartDateTime",
            "usrBillCycleDate",
            "password_gen_method",
            "ims_pgw_endpoint_pass",
            "ims_pgw_endpoint_user",
            "network_service_names",
            "vqt_percentage",

          ]
        }
}
}



end

end
