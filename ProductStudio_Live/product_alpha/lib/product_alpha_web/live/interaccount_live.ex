defmodule ProductAlphaWeb.InteraccountLive do
  use ProductAlphaWeb, :live_view

  import Ecto.Query, warn: false
  import Ecto.Repo, warn: false

  alias ProductAlpha.Interaccounts.Interaccount
  alias ProductAlpha.Repo
  alias ProductAlpha.Products

  def mount(_params, session, socket) do
    ref_schema = schema("GER")
    session_id = session["product_id"]
    sess_pro = session["product"]
    IO.inspect(session_id)

    hata = Products.get_product!(session_id)
    IO.inspect(hata.name)

    {:ok, assign(socket, ref_schema: ref_schema, prod_id: session_id, prodname: hata.name)}
  end

  def handle_event("load-schema", %{"code" => code}, socket) do
    ko = Jason.encode!(schema(code))
    ref_prodid = IO.inspect(socket.assigns.prod_id)
    ll = get_interaccount_byprod(ref_prodid)
    IO.inspect(ll.datab)
    #  IO.inspect(ko)
    # #IO.inspect(get_policy(3))
    # ll = get_policy(3)
    # ll.data
    #  IO.inspect(schema(code))
    {:reply, %{schema: schema(code), interacc: ll.datab}, socket}
  end

  def handle_event("submit", params, socket) do
    ref_prodid = IO.inspect(socket.assigns.prod_id)
    ref_schema = socket.assigns.ref_schema
    IO.inspect(params)

    case ExJsonSchema.Validator.validate(ref_schema, params) do
      :ok ->
        {:ok, _updated_policy} = update_interaccount(ref_prodid, params)
        {:noreply, put_flash(socket, :info, "Success!")}

      {:error, _errors} ->
        {:noreply, put_flash(socket, :error, "Errors!")}
    end
  end

  def update_interaccount(product_id, updated_data) do
    # Use get_policy!/1 to raise an error if the policy is not found
    service = get_interaccount_byprod(product_id)
    IO.inspect(Jsontransformer.transform_inter_acc(startinteracc()))
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
    Repo.get(ProductAlpha.Interaccounts.Interaccount, product_id)
    # hata.data
  end

  def get_interaccount_byprod(product_id) do
    # our scema file
    ProductAlpha.Interaccounts.Interaccount
    |> where(product_id: ^product_id)
    # basically is for returning user data wtogether with account
    # this bcs of the relationship between the two
    |> preload([:product])
    |> Repo.one()
  end

  def startinteracc() do
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
    #
    %{
      "type" => "object",
      "title" => "Inter-account ",
      "properties" => %{
        "Inter-account transfer specification" => %{
          "type" => "object",
          "properties" => %{
            "allowed_services" => %{
              "items" => %{
                "title" => "Service",
                "type" => "string"
              },
              "type" => "array",
                "options" => %{
                  "collapsed" => true },
                 "propertyOrder" => 8
            },
            "data" => %{
              "properties" => %{
                "default_wallet" => %{"type" => "string"},
                "enabled_wallets" => %{"items" => %{"type" => "string"}, "type" => "array"}
              },
              "required" => ["default_wallet", "enabled_wallets"],
              "type" => "object",
              "options" => %{
                "collapsed" => true },
              "propertyOrder" => 5
            },
            "destination" => %{"type" => "boolean", "propertyOrder" => 2},
            "enabled" => %{"type" => "boolean", "propertyOrder" => 1},
            "policy_name" => %{"type" => "string", "propertyOrder" => 3},
            "primary" => %{
              "properties" => %{
                "default_wallet" => %{"type" => "string"},
                "enabled_wallets" => %{
                  "items" => %{"type" => "string"},
                  "type" => "array",
                  "options" => %{
                    "collapsed" => true
                  }
                }
              },
              "required" => ["default_wallet", "enabled_wallets"],
              "type" => "object",
              "options" => %{
                "collapsed" => true },
              "propertyOrder" => 7
            },
            "sms" => %{
              "properties" => %{
                "default_wallet" => %{"type" => "string"},
                "enabled_wallets" => %{"items" => %{"type" => "string"}, "type" => "array"}
              },
              "required" => ["default_wallet", "enabled_wallets"],
              "type" => "object",
              "propertyOrder" => 4,
              "options" => %{
                "collapsed" => true
              }
            },
            "source" => %{"type" => "boolean", "propertyOrder" => 0},
            "valid_dst_policy_statuses" => %{
              "items" => %{"type" => "string"},
              "type" => "array",
              "options" => %{
                "collapsed" => true },
              "propertyOrder" => 9
            },
            "valid_dst_service_statuses" => %{
              "items" => %{"type" => "integer"},
              "type" => "array",
              "options" => %{
                "collapsed" => true },
              "propertyOrder" => 11
            },
            "valid_src_policy_statuses" => %{
              "items" => %{"type" => "string"},
              "type" => "array",
              "options" => %{
                "collapsed" => true },
              "propertyOrder" => 10
            },
            "valid_src_service_statuses" => %{
              "items" => %{"type" => "integer"},
              "type" => "array",
              "options" => %{
                "collapsed" => true },
              "propertyOrder" => 12
            },
            "voice" => %{
              "properties" => %{
                "default_wallet" => %{"type" => "string"},
                "enabled_wallets" => %{"items" => %{"type" => "string"}, "type" => "array"}
              },
              "required" => ["default_wallet", "enabled_wallets"],
              "type" => "object",
              "options" => %{
                "collapsed" => true },
              "propertyOrder" => 6
            }
          },
          "required" => [
            "sms",
            "data",
            "voice",
            "source",
            "enabled",
            "primary",
            "destination",
            "policy_name",
            "allowed_services",
            "valid_dst_policy_statuses",
            "valid_src_policy_statuses",
            "valid_dst_service_statuses",
            "valid_src_service_statuses"
          ]
        }
      }
    }
  end
end
