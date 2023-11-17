defmodule ProductAlphaWeb.RechargespecLive do

    use ProductAlphaWeb, :live_view


    def mount(_params, _session, socket) do
      ref_schema = schema("GER")

      {:ok, assign(socket, :ref_schema,  ref_schema)}
   end

    def handle_event("load-schema", %{"code" => code}, socket) do
       ko = Jason.encode!(schema(code))
       IO.inspect(ko)
      # #IO.inspect(get_policy(3))
      # ll = get_policy(3)
      # ll.data
    #  IO.inspect(schema(code))
      {:reply, %{schema: schema(code),rechargespe: startrecharge() }, socket}
    end


    def handle_event("submit", params, socket) do
      ref_schema = socket.assigns.ref_schema
      IO.inspect(params)

      case ExJsonSchema.Validator.validate(ref_schema, params) do
        :ok ->

          {:noreply, put_flash(socket, :info, "Success!")}

        {:error, _errors} ->
          {:noreply, put_flash(socket, :error, "Errors!")}
      end
    end


    def startrecharge() do
      %{
          "Recharge specification" => %{
            "data_mappings" => %{
              "expiry_unit" => "DAYS",
              "expiry_value" => 90,
              "increment" => 50,
              "max" => 501,
              "min" => 50,
              "model" => "ROLLING",
              "unit_cost" => 4.6566129e-8
            },
            "data_topup_notification" => "data_topup_confirmation",
            "default_data_wallet" => "data0",
            "default_mappings" => %{
              "expiry_unit" => "DAYS",
              "expiry_value" => 90,
              "increment" => 50,
              "max" => 501,
              "min" => 50,
              "model" => "ROLLING",
              "unit_rate" => 1
            },
            "default_sms_wallet" => "sms0",
            "default_unit_rate" => 1,
            "default_voice_wallet" => "voice0",
            "default_wallet" => "primary",
            "sms_mappings" => %{
              "expiry_unit" => "DAYS",
              "expiry_value" => 30,
              "increment" => 10,
              "max" => 100,
              "min" => 10,
              "model" => "ROLLING",
              "unit_cost" => 0.2
            },
            "sms_topup_notification" => "sms_topup_confirmation",
            "voice_mappings" => %{
              "expiry_unit" => "DAYS",
              "expiry_value" => 30,
              "increment" => 50,
              "max" => 501,
              "min" => 50,
              "model" => "ROLLING",
              "unit_cost" => 0.016666666666667
            },
            "voice_topup_notification" => "voice_topup_confirmation"
          }


      }
    end
    defp schema("GER") do
    # You'd probably load the schema from either your database
    # or a JSON file, but we'll simply hard-code it for now:
      %{
        "type" => "object",
        "title" => "Recharge specification",
        "properties" => %{
        "Recharge specification" => %{
            "type" => "object",
            "properties" => %{
              "sms_mappings" => %{
                "properties" => %{
                  "expiry_unit" => %{"type" => "string"},
                  "expiry_value" => %{"type" => "integer"},
                  "increment" => %{"type" => "integer"},
                  "max" => %{"type" => "integer"},
                  "min" => %{"type" => "integer"},
                  "model" => %{"type" => "string"},
                  "unit_cost" => %{"type" => "number"}
                },
                "required" => ["max", "min", "model", "increment", "unit_cost", "expiry_unit",
                 "expiry_value"],
                "type" => "object",
                "propertyOrder" => 0
              },
              "data_mappings" => %{
                "properties" => %{
                  "expiry_unit" => %{"type" => "string"},
                  "expiry_value" => %{"type" => "integer"},
                  "increment" => %{"type" => "integer"},
                  "max" => %{"type" => "integer"},
                  "min" => %{"type" => "integer"},
                  "model" => %{"type" => "string"},
                  "unit_cost" => %{"type" => "number"}
                },
                "required" => ["max", "min", "model", "increment", "unit_cost", "expiry_unit",
                 "expiry_value"],
                "type" => "object",
                "propertyOrder" => 1
              },
              "default_wallet" => %{"type" => "string",
              "propertyOrder" => 2},
              "voice_mappings" => %{
                "properties" => %{
                  "expiry_unit" => %{"type" => "string"},
                  "expiry_value" => %{"type" => "integer"},
                  "increment" => %{"type" => "integer"},
                  "max" => %{"type" => "integer"},
                  "min" => %{"type" => "integer"},
                  "model" => %{"type" => "string"},
                  "unit_cost" => %{"type" => "number"}
                },
                "required" => ["max", "min", "model", "increment", "unit_cost", "expiry_unit",
                 "expiry_value"],
                "type" => "object",
                "propertyOrder" => 3
              },
              "default_mappings" => %{
                "properties" => %{
                  "expiry_unit" => %{"type" => "string"},
                  "expiry_value" => %{"type" => "integer"},
                  "increment" => %{"type" => "integer"},
                  "max" => %{"type" => "integer"},
                  "min" => %{"type" => "integer"},
                  "model" => %{"type" => "string"},
                  "unit_rate" => %{"type" => "integer"}
                },
                "required" => ["max", "min", "model", "increment", "unit_rate", "expiry_unit",
                 "expiry_value"],
                "type" => "object",
                "propertyOrder" => 4
              },
              "default_unit_rate" => %{"type" => "integer",
              "propertyOrder" => 5},
              "default_sms_wallet" => %{"type" => "string",
              "propertyOrder" => 6},
              "default_data_wallet" => %{"type" => "string",
              "propertyOrder" => 7},
              "default_voice_wallet" => %{"type" => "string",
              "propertyOrder" => 8},
              "sms_topup_notification" => %{"type" => "string",
              "propertyOrder" => 9},
              "data_topup_notification" => %{"type" => "string",
              "propertyOrder" => 10},
              "voice_topup_notification" => %{"type" => "string",
              "propertyOrder" => 11}


            },

    "required" => ["sms_mappings", "data_mappings", "default_wallet", "voice_mappings",
     "default_mappings", "default_unit_rate", "default_sms_wallet", "default_data_wallet",
     "default_voice_wallet", "sms_topup_notification", "data_topup_notification",
     "voice_topup_notification"]
          }
  }
  }



  end







end
