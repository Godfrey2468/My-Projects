defmodule ProductAlphaWeb.WalletLive do
  use ProductAlphaWeb, :live_view


  def mount(_params, _session, socket) do
    ref_schema = schema("GER")

      {:ok, assign(socket, :ref_schema, ref_schema)}
 end

  def handle_event("load-wallet", %{"code" => code}, socket) do
   {:reply, %{schema: schema(code)}, socket}
 end

 defp schema("GER") do
   %{
     "title" => "wallet config",
     "properties" => %{
      "additional wallet configuration" => %{
        "type" => "array",
        "items" => %{
          "type" => "object",
          "properties" => %{
            "sms0" => %{
              "type" => "object",
              "properties" => %{
                "expiry" => %{
                  "type" => "null"
                },
                "type" => %{
                  "type" => "string"
                },
                "rules" => %{
                  "type" => "array",
                  "items" => false
                },
                "available" => %{
                  "type" => "integer"
                }
              },
              "required" => [
                "expiry",
                "type",
                "rules",
                "available"
              ]
            },
            "sms_sub" => %{
              "type" => "array",
              "items" => %{
                "type" => "object",
                "properties" => %{
                  "trn" => %{
                    "format" => "table",
                    "type" => "array",
                    "items" => %{
                      "type" => "object",
                      "properties" => %{
                        "name" => %{
                          "type" => "string"
                        },
                        "amount" => %{
                          "type" => "integer"
                        },
                        "status" => %{
                          "type" => "string"
                        },
                        "inserted_at" => %{
                          "type" => "string",
                          "format" => "date-time"
                        }
                      },
                      "required" => [
                        "name",
                        "amount",
                        "status",
                        "inserted_at"
                      ]
                    }
                  },
                  "expiry" => %{
                    "type" => "null"
                  },
                  "amount_at_last_topup" => %{
                    "type" => "integer"
                  },
                  "type" => %{
                    "type" => "string"
                  },
                  "available" => %{
                    "type" => "integer"
                  },
                  "rules" => %{
                    "type" => "object",
                    "properties" => %{
                      "auto_refill" => %{
                        "type" => "object",
                        "properties" => %{
                          "mode" => %{
                            "type" => "string"
                          },
                          "expiry" => %{
                            "type" => "string"
                          },
                          "available" => %{
                            "type" => "integer"
                          }
                        },
                        "required" => [
                          "mode",
                          "expiry",
                          "available"
                        ]
                      }
                    },
                    "required" => [
                      "auto_refill"
                    ]
                  }
                },
                "required" => [
                  "trn",
                  "expiry",
                  "amount_at_last_topup",
                  "type",
                  "available",
                  "rules"
                ]
              }
            }}}}}
   }
 end




end
