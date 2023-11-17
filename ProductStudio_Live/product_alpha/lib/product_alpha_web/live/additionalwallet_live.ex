defmodule ProductAlphaWeb.AdditionalwalletLive do
    use ProductAlphaWeb, :live_view

    import Ecto.Query, warn: false
    import Ecto.Repo, warn: false

   alias ProductAlpha.Productprice.Wallet
   alias ProductAlpha.Repo
   alias ProductAlpha.Products

    def mount(_params, session, socket) do
      ref_schema = schema("GER")
      session_id = session["product_id"]
      sess_pro = session["product"]
      IO.inspect(sess_pro)

      hata = Products.get_product!(session_id)
      IO.inspect(hata.name)

      {:ok, assign(socket, ref_schema: ref_schema, prod_id: session_id,prodname: hata.name)}
   end

    def handle_event("load-schema", %{"code" => code}, socket) do
      ref_prodid = IO.inspect(socket.assigns.prod_id)
      ko = Jason.encode!(schema(code))
      ll = get_wallet_id(ref_prodid)
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

          {:ok, _updated_policy} = update_wallet(ref_prodid, params)
          {:noreply, put_flash(socket, :info, "Success!")}


        {:error, _errors} ->
          {:noreply, put_flash(socket, :error, "Errors!")}
      end
    end

    def update_wallet(product_id, updated_data) do
      service = get_wallet_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
      IO.inspect(service)
      |> Ecto.Changeset.change(datab: updated_data)
      |> Repo.update()
    end

    def get_service(product_id) do
      Repo.get(ProductAlpha.Providers.Provider,product_id)
      # hata.data
    end

    def get_wallet_id(product_id) do
      ProductAlpha.Productprice.Wallet # our scema file
      |> where(product_id: ^product_id)
      # basically is for returning user data wtogether with account
      |> preload([:product]) # this bcs of the relationship between the two
      |> Repo.one()
    end




    def startwallet() do
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
    # "options": {
      # "collapsed": true
      # },
      %{
        "type" => "object",
        "title" => "Wallet Config",
        "options" => %{
          "disable_collapse" => true,
          "disable_properties" => true
        },
        "properties" => %{
            "additional wallet configuration" => %{
              "items" => %{
               "title" => "wallet",
                "properties" => %{
                  "data0" => %{
                    "properties" => %{
                      "available" => %{"type" => "integer"},
                      "meta" => %{
                        "properties" => %{"expiry" => %{"type" => "null"}},
                        "required" => ["expiry"],
                        "type" => "object"
                      },
                      "rules" => %{"items" => false, "type" => "array"},
                      "type" => %{"type" => "string"}
                    },
                    "required" => ["meta", "type", "rules", "available"],
                    "type" => "object",
                    "propertyOrder" => 2
                  },
                  "data_sub" => %{
                    "properties" => %{
                      "available" => %{"type" => "integer"},
                      "meta" => %{
                        "properties" => %{
                          "amount_at_last_topup" => %{"type" => "integer"},
                          "expiry" => %{"type" => "null"},
                          "trn" => %{
                            "items" => %{
                              "properties" => %{
                                "amount" => %{"type" => "integer"},
                                "inserted_at" => %{"format" => "date-time", "type" => "string"},
                                "name" => %{"type" => "string"},
                                "status" => %{"type" => "string"}
                              },
                              "required" => ["name", "amount", "status", "inserted_at"],
                              "type" => "object"
                            },
                            "type" => "array"
                          }
                        },
                        "required" => ["trn", "expiry", "amount_at_last_topup"],
                        "type" => "object"

                      },
                      "rules" => %{
                        "items" => %{
                          "properties" => %{
                            "auto_refill" => %{
                              "properties" => %{
                                "available" => %{"type" => "integer"},
                                "expiry" => %{"type" => "string"},
                                "mode" => %{"type" => "string"}
                              },
                              "required" => ["mode", "expiry", "available"],
                              "type" => "object"
                            }
                          },
                          "required" => ["auto_refill"],
                          "type" => "object"
                        },
                        "type" => "array"
                      },
                      "type" => %{"type" => "string"}
                    },
                    "required" => ["meta", "type", "rules", "available"],
                    "type" => "object",
                    "propertyOrder" => 3
                  },
                  "free_data" => %{
                    "properties" => %{
                      "available" => %{"type" => "integer"},
                      "meta" => %{
                        "properties" => %{"expiry" => %{"type" => "null"}},
                        "required" => ["expiry"],
                        "type" => "object"
                      },
                      "rules" => %{"items" => false, "type" => "array"},
                      "type" => %{"type" => "string"}
                    },
                    "required" => ["meta", "type", "rules", "available"],
                    "type" => "object",
                    "propertyOrder" => 6
                  },
                  "sms0" => %{
                    "properties" => %{
                      "available" => %{"type" => "integer"},
                      "expiry" => %{"type" => "null"},
                      "rules" => %{"items" => false, "type" => "array"},
                      "type" => %{"type" => "string"}
                    },
                    "required" => ["expiry", "type", "rules", "available"],
                    "type" => "object",
                    "propertyOrder" => 0
                  },
                  "sms_sub" => %{
                    "items" => %{
                      "properties" => %{
                        "amount_at_last_topup" => %{"type" => "integer"},
                        "available" => %{"type" => "integer"},
                        "expiry" => %{"type" => "null"},
                        "rules" => %{
                          "properties" => %{
                            "auto_refill" => %{
                              "properties" => %{
                                "available" => %{"type" => "integer"},
                                "expiry" => %{"type" => "string"},
                                "mode" => %{"type" => "string"}
                              },
                              "required" => ["mode", "expiry", "available"],
                              "type" => "object"
                            }
                          },
                          "required" => ["auto_refill"],
                          "type" => "object"
                        },
                        "trn" => %{
                          "items" => %{
                            "properties" => %{
                              "amount" => %{"type" => "integer"},
                              "inserted_at" => %{"format" => "date-time", "type" => "string"},
                              "name" => %{"type" => "string"},
                              "status" => %{"type" => "string"}
                            },
                            "required" => ["name", "amount", "status", "inserted_at"],
                            "type" => "object"
                          },
                          "type" => "array"
                        },
                        "type" => %{"type" => "string"}
                      },
                      "required" => ["trn", "expiry", "amount_at_last_topup", "type", "available", "rules"],
                      "type" => "object"
                    },
                    "type" => "array",
                    "propertyOrder" => 1
                  },
                  "voice0" => %{
                    "properties" => %{
                      "available" => %{"type" => "integer"},
                      "meta" => %{
                        "properties" => %{"expiry" => %{"type" => "null"}},
                        "required" => ["expiry"],
                        "type" => "object"
                      },
                      "rules" => %{"items" => false, "type" => "array"},
                      "type" => %{"type" => "string"}
                    },
                    "required" => ["meta", "type", "rules", "available"],
                    "type" => "object",
                    "propertyOrder" => 4
                  },
                  "voice_sub" => %{
                    "properties" => %{
                      "available" => %{"type" => "integer"},
                      "meta" => %{
                        "properties" => %{
                          "amount_at_last_topup" => %{"type" => "integer"},
                          "expiry" => %{"type" => "null"},
                          "trn" => %{
                            "items" => %{
                              "properties" => %{
                                "amount" => %{"type" => "integer"},
                                "inserted_at" => %{"format" => "date-time", "type" => "string"},
                                "name" => %{"type" => "string"},
                                "status" => %{"type" => "string"}
                              },
                              "required" => ["name", "amount", "status", "inserted_at"],
                              "type" => "object"
                            },
                            "type" => "array"
                          }
                        },
                        "required" => ["trn", "expiry", "amount_at_last_topup"],
                        "type" => "object"
                      },
                      "rules" => %{
                        "items" => %{
                          "properties" => %{
                            "auto_refill" => %{
                              "properties" => %{
                                "available" => %{"type" => "integer"},
                                "expiry" => %{"type" => "string"},
                                "mode" => %{"type" => "string"}
                              },
                              "required" => ["mode", "expiry", "available"],
                              "type" => "object"
                            }
                          },
                          "required" => ["auto_refill"],
                          "type" => "object"
                        },
                        "type" => "array"
                      },
                      "type" => %{"type" => "string"}
                    },
                    "required" => ["meta", "type", "rules", "available"],
                    "type" => "object",
                    "propertyOrder" => 5
                  }
                },
                "type" => "object"
              },
              "type" => "array"
            }


          }

  }



  end




end
