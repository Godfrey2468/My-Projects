defmodule ProductAlphaWeb.NetworkresourceLive do
  use ProductAlphaWeb, :live_view
  alias ProductAlphaWeb.JsonLive


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
    {:reply, %{schema: schema(code), networkres: startnetwork()}, socket}
  end


  def handle_event("submit", params, socket) do
    ref_schema = socket.assigns.ref_schema
    IO.inspect(params)

    case ExJsonSchema.Validator.validate(ref_schema, params) do
      :ok ->
       {:ok, hfhf} = JsonLive.network_service(ref_schema)
       IO.inspect(hfhf)
        {:noreply, put_flash(socket, :info, "Success!")}

      {:error, _errors} ->
        {:noreply, put_flash(socket, :error, "Errors!")}
    end
  end


  def startnetwork() do
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
        "default_quota" => %{
          "name" => "totalVolume",
          "quota" => 268_435_456
        },
        "xxxfinal_unit" => %{
          "finalUnitIndication" => %{
            "finalUnitAction" => "TERMINATE"
          }
        },
        "vqt_percentage" => 0.5,
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
        ],
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
            "default_quota" => %{
              "type" => "object",
              "propertyOrder" => 31,
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
              "propertyOrder" => 32,
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
            "vqt_percentage" => %{
              "type" => "number",
              "propertyOrder" => 33

            },
            "threshold_notifications" => %{
              "type" => "array",
              "propertyOrder" => 34,
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
            },
            "Logical Resource" => %{
              "type" => "array",
              "propertyOrder" => 35,
              "items" => %{
                "type" => "object",
                "properties" => %{
                  "isOperational" => %{
                    "type" => "string"
                  },
                  "irStatus" => %{
                    "type" => "string"
                  },
                  "serviceState" => %{
                    "type" => "string"
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
              "propertyOrder" => 36,
              "items" => %{
                "type" => "object",
                "properties" => %{
                  "ManufactureDate" => %{
                    "type" => "string",
                    "format" => "date"
                  },
                  "otherIdentifier" => %{
                    "type" => "string"
                  },
                  "PowerState" => %{
                    "type" => "string"
                  },
                  "serial number" => %{
                    "type"  => "string"
                  },
                  "version number" => %{
                    "type" => "string"
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
              "propertyOrder" => 37,
              "items" => %{
                "type" => "object",
                "properties" => %{
                  "type" => %{
                    "type" => "string"
                  },
                  "manufacturer" => %{
                    "type" =>  "string"
                  },
                  "model" => %{
                    "type" => "string"
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
            "default_quota",
            "xxxfinal_unit",
            "vqt_percentage",
            "threshold_notifications",
            "Logical Resource",
            "Physical Resource",
            "Device"
          ]
        }
}
}



end




end
