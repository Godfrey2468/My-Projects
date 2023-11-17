# Original JSON data
defmodule Jsontransformer do

 @moduledoc """
  Module for transforming logical JSON data  into physical JSON data.
  This is the logical from the from the designed for the the product studio app.
  """

  @doc"""

    Transforms logical JSON data into physical JSON data following specific rules.

  ## Parameters

  - `logical_json` (map): The logical JSON data to be transformed.

  ## Returns

  A map representing the physical JSON data.

  """

  # ------------------------------------------------------------------------------------------------------------

# Function to transform full logical JSON Object to Physical JSON object


  def transform_logical_to_physical(logical_data) do
    physical_data = []

    product_specification = Map.get(logical_data, "Product Specification", %{})

    # Mapping rules to map differents fields to the physical
    physical_entry = %{
      "id" => Map.get(product_specification, "id", nil),
      "name" => Map.get(product_specification, "name", nil),
      "order" => Map.get(product_specification, "order", nil),
      "type" => %{
        "simple" => true,
        "time_band" => false
      },
      "currency_id" => Map.get(product_specification, "currency_id", nil),
      "unit_id" => "67710099-35c3-4fd9-8403-6bf5ff19d112",
      "applies_to" => %{
        "balances" =>
          Map.get(product_specification, "Consumption billing", %{})["applies_to"]["balances"] ||
            [],
        "service_type" =>
          Map.get(product_specification, "Consumption billing", %{})["applies_to"]["service_type"]
      },
      "managed_by" => %{},
      "plan" => %{
        "gl_code" =>
          hd(Map.get(product_specification, "Product Price", [%{}]))["Base price"]["gl_code"],
        "free_units" =>
          hd(Map.get(product_specification, "Product Price", [%{}]))["Base price"]["free_units"] ||
            0,
        "billing_code" =>
          hd(Map.get(product_specification, "Product Price", [%{}]))["Base price"]["billing_code"],
        "default_text" =>
          hd(Map.get(product_specification, "Product Price", [%{}]))["Base price"]["default_text"],
        "invoicing_mode" =>
          hd(Map.get(product_specification, "Product Price", [%{}]))["Base price"][
            "invoicing_mode"
          ],
        "post_surcharge" =>
          hd(Map.get(product_specification, "Product Price", [%{}]))["Base price"][
            "post_surcharge"
          ] || 0,
        "rounding_policy" => "1.110000",
        "add_wallet_config" =>
          hd(Map.get(product_specification, "Product Price", [%{}]))[
            "additional wallet configuration"
          ] || [],
        "connect_surcharge" => 0,
        "default_unit_rate" => 0.00000004049228585284689,
        "default_spend_limit" => 0,
        "initial_service_policy" =>
          Map.get(product_specification, "Policies", %{})["initial_service_policy"][
            "MASTER_POLICY"
          ]
      },
      "service" => %{
        "cc" => [Map.get(product_specification, "Network Resource Specification", %{})["cc"]],
        "ims" => Map.get(product_specification, "Network Resource Specification", %{})["ims"],
        "mcc" => [Map.get(product_specification, "Network Resource Specification", %{})["mcc"]],
        "mnc" =>
          Map.get(product_specification, "Network Resource Specification", %{})["mnc"] || [],
        "ndc" => [Map.get(product_specification, "Network Resource Specification", %{})["ndc"]],
        "tpl" => Map.get(product_specification, "Network Resource Specification", %{})["tpl"],
        "vobb" =>
          Map.get(product_specification, "Network Resource Specification", %{})["vobb"] || true,
        "hlrsn" => Map.get(product_specification, "Network Resource Specification", %{})["hlrsn"],
        "sicap" =>
          Map.get(product_specification, "Network Resource Specification", %{})["sicap"] || true,
        "access" =>
          Map.get(product_specification, "Network Resource Specification", %{})["access"],
        "simota" =>
          Map.get(product_specification, "Network Resource Specification", %{})["simota"],
        "srvName" =>
          Map.get(product_specification, "Network Resource Specification", %{})["srvName"],
        "usrState" =>
          Map.get(product_specification, "Network Resource Specification", %{})["usrState"],
        "ims_voice" =>
          Map.get(product_specification, "Network Resource Specification", %{})["ims_voice"] ||
            false,
        "snPatterns" => [
          Map.get(product_specification, "Network Resource Specification", %{})["snPatterns"]
        ],
        "usrExAttr1" =>
          Map.get(product_specification, "Network Resource Specification", %{})["usrExAttr1"],
        "vobb_realm" =>
          Map.get(product_specification, "Network Resource Specification", %{})["vobb_realm"],
        "ims_srvName" =>
          Map.get(product_specification, "Network Resource Specification", %{})["ims_srvName"],
        "ims_template" =>
          Map.get(product_specification, "Network Resource Specification", %{})["ims_template"],
        "usrIdentifier" =>
          Map.get(product_specification, "Network Resource Specification", %{})["usrIdentifier"],
        "usrSubNetType" =>
          Map.get(product_specification, "Network Resource Specification", %{})["usrSubNetType"],
        "password_prefix" =>
          Map.get(product_specification, "Network Resource Specification", %{})["password_prefix"],
        "password_suffix" =>
          Map.get(product_specification, "Network Resource Specification", %{})["password_suffix"],
        "simota_base_url" =>
          Map.get(product_specification, "Network Resource Specification", %{})["simota_base_url"],
        "ims_pgw_endpoint" =>
          Map.get(product_specification, "Network Resource Specification", %{})[
            "ims_pgw_endpoint"
          ],
        "srvStartDateTime" => "CURRENT_DATETIME (GMT+2)",
        "usrBillCycleDate" =>
          Map.get(product_specification, "Network Resource Specification", %{})[
            "usrBillCycleDate"
          ],
        "password_gen_method" =>
          Map.get(product_specification, "Network Resource Specification", %{})[
            "password_gen_method"
          ],
        "ims_pgw_endpoint_pass" =>
          Map.get(product_specification, "Network Resource Specification", %{})[
            "ims_pgw_endpoint_pass"
          ],
        "ims_pgw_endpoint_user" =>
          Map.get(product_specification, "Network Resource Specification", %{})[
            "ims_pgw_endpoint_user"
          ],
        "network_service_names" => [
          Map.get(product_specification, "Network Resource Specification", %{})[
            "network_service_names"
          ]
        ]
      },
      "routing" => %{},
      "destination_group" => %{},
      "short_description" => Map.get(product_specification, "name", nil),
      "description" => "A multi-wallet product",
      "taxes" => %{
        "gl" => "9500A030",
        "name" => "VAT",
        "fixed" => 0,
        "percentage" => 15
      },
      "target_groups" => %{},
      "history" => %{},
      "meta" => %{
        "iax" => Map.get(product_specification, "Inter-account transfer specification", %{}),
        "model" => "PRE-PAID",
        "recharge" => Map.get(product_specification, "Recharge specification", %{}),
        "unit_info" => Map.get(product_specification, "Policies", %{}),
        "final_unit" => %{},
        "quota_calc" => "default",
        "quota_rules" => [],
        "neg_balances" => [],
        "calculation" =>
          Map.get(product_specification, "Inter-account transfer specification", %{})[
            "calculation"
          ] || "new",
        "calc_count" => "new",
        "status" => "INDEV",
        "activation" =>
          Map.get(product_specification, "Recharge specification", %{})["activation"],
        "user_type" => Map.get(product_specification, "Policies", %{})["user_type"],
        "rating_param" => "default",
        "created_on" => "CURRENT_DATETIME (GMT+2)",
        "updated_on" => "CURRENT_DATETIME (GMT+2)"
      },
      "info" => %{},
      "active" => true,
      "policy_id" =>
        Map.get(product_specification, "Policies", %{})["initial_service_policy"]["MASTER_POLICY"],
      "tariffs" => %{},
      "valid_from" => "2021-03-01T00:00:00Z"
    }

    physical_data = [physical_entry]

    physical_data
  end

  # -----------------------------------------------------------------------------------------
  # Funtion to transform Full Physical JSON Data To Logical Data

  def transform_physical_to_logical(json_data) do
    logical_data = %{
        "Product Specification" => %{
            "id" => json_data["id"],
            "name" => json_data["name"],
            "order" => json_data["order"],
            "currency_id" => json_data["currency_id"],
            "Product Price" =>
                %{
                    "additional wallet configuration" => json_data["plan"]["add_wallet_config"],
                    "Base price" => %{
                        "gl_code" => json_data["plan"]["gl_code"],
                        "free_units" => json_data["plan"]["free_units"],
                        "billing_code" => json_data["plan"]["billing_code"],
                        "default_text" => json_data["plan"]["default_text"],
                        "invoicing_mode" => json_data["plan"]["invoicing_mode"],
                        "post_surcharge" => json_data["plan"]["post_surcharge"],
                        "default_spend_limit" => json_data["plan"]["default_spend_limit"]
                    },
                    "Subscription billing" => [
                        %{
                            "fee" => "1000",
                            "amount" => "1000",
                            "status" => "subscribed"
                        }
                    ],
                    "Discounts" => [
                        %{
                            "name" => "top-up",
                            "description" => "monthly top-up",
                            "percentage" => "10%"
                        },
                        %{
                            "name" => "seasonal discount",
                            "description" => "discount is provided every season",
                            "percentage" => "20%"
                        }
                    ],
                    "Consumption billing" => %{
                        "consumption period" => "3 months",
                        "effective date" => "2023-05-25",
                        "value" => "",
                        "event charging" => json_data["plan"]["initial_service_policy"]["MASTER_POLICY"],
                        "real-time charging specification" => %{
                            "gl_code" => json_data["plan"]["gl_code"],
                            "free_units" => json_data["plan"]["free_units"],
                            "billing_code" => json_data["plan"]["billing_code"],
                            "default_text" => json_data["plan"]["default_text"],
                            "invoicing_mode" => json_data["plan"]["invoicing_mode"],
                            "post_surcharge" => json_data["plan"]["post_surcharge"],
                            "default_spend_limit" => json_data["plan"]["default_spend_limit"]
                        }
                    }
                }
            ,
            "Network Resource Specification" => %{
                "cc" => json_data["service"]["cc"],
                "ims" => json_data["service"]["ims"],
                "mcc" => json_data["service"]["mcc"],
                "mnc" => json_data["service"]["mnc"],
                "ndc" => json_data["service"]["ndc"],
                "tpl" => json_data["service"]["tpl"],
                "vobb" => json_data["service"]["vobb"],
                "hlrsn" => json_data["service"]["hlrsn"],
                "sicap" => json_data["service"]["sicap"],
                "access" => json_data["service"]["access"],
                "simota" => json_data["service"]["simota"],
                "srvName" => json_data["service"]["srvName"],
                "usrState" => json_data["service"]["usrState"],
                "ims_voice" => json_data["service"]["ims_voice"],
                "snPatterns" => json_data["service"]["snPatterns"],
                "usrExAttr1" => json_data["service"]["usrExAttr1"],
                "vobb_realm" => json_data["service"]["vobb_realm"],
                "ims_srvName" => json_data["service"]["ims_srvName"],
                "ims_template" => json_data["service"]["ims_template"],
                "usrIdentifier" => json_data["service"]["usrIdentifier"],
                "usrSubNetType" => json_data["service"]["usrSubNetType"],
                "password_prefix" => json_data["service"]["password_prefix"],
                "password_suffix" => json_data["service"]["password_suffix"],
                "simota_base_url" => json_data["service"]["simota_base_url"],
                "ims_pgw_endpoint" => json_data["service"]["ims_pgw_endpoint"],
                "srvStartDateTime" => json_data["service"]["srvStartDateTime"],
                "usrBillCycleDate" => json_data["service"]["usrBillCycleDate"],
                "password_gen_method" => json_data["service"]["password_gen_method"],
                "ims_pgw_endpoint_pass" => json_data["service"]["ims_pgw_endpoint_pass"],
                "ims_pgw_endpoint_user" => json_data["service"]["ims_pgw_endpoint_user"],
                "network_service_names" => json_data["service"]["network_service_names"],
                "default_quota" => json_data["service"]["default_quota"],
                "xxxfinal_unit" => json_data["service"]["xxxfinal_unit"],
                "vqt_percentage" => json_data["service"]["vqt_percentage"],
                "threshold_notifications" => json_data["service"]["threshold_notifications"],
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
            },
            "Service Provider" => [
                %{
                    "name" => "rain",
                    "address" => "Block D, The Main Straight, 392 Main Rd, Bryanston, Johannesburg, 2191",
                    "contact details" => "0816101000"
                }
            ],
            "Recharge specification" => json_data["plan"]["recharge"],
            "Inter-account transfer specification" => json_data["meta"],
            "Policies" => json_data["meta"]["unit_info"]
        }
    }

  end

# end






# Transform the logical JSON into physical JSON
#physical_json_data = PhysicalTransformation.transform_logical_to_physical(logical_data)


# Function for transforming Network Resource Spec

  def transform_network_resource(logical_json) do
    # Transformation code
    # Rules on Logical to physical Transformation
    _physical_json = %{
      "service" => %{
        "cc" => [logical_json["Network Resource Specification"]["cc"]],
        "ims" => logical_json["Network Resource Specification"]["ims"],
        "mcc" => [logical_json["Network Resource Specification"]["mcc"]],
        "mnc" => [logical_json["Network Resource Specification"]["mnc"]],
        "ndc" => [logical_json["Network Resource Specification"]["ndc"]],
        "tpl" => logical_json["Network Resource Specification"]["tpl"],
        "vobb" => logical_json["Network Resource Specification"]["vobb"],
        "hlrsn" => logical_json["Network Resource Specification"]["hlrsn"],
        "sicap" => logical_json["Network Resource Specification"]["sicap"],
        "access" => logical_json["Network Resource Specification"]["access"],
        "simota" => logical_json["Network Resource Specification"]["simota"],
        "srvName" => logical_json["Network Resource Specification"]["srvName"],
        "usrState" => logical_json["Network Resource Specification"]["usrState"],
        "ims_voice" => logical_json["Network Resource Specification"]["ims_voice"],
        "snPatterns" => [logical_json["Network Resource Specification"]["snPatterns"]],
        "usrExAttr1" => logical_json["Network Resource Specification"]["usrExAttr1"],
        "vobb_realm" => logical_json["Network Resource Specification"]["vobb_realm"],
        "ims_srvName" => logical_json["Network Resource Specification"]["ims_srvName"],
        "ims_template" => logical_json["Network Resource Specification"]["ims_template"],
        "usrIdentifier" => logical_json["Network Resource Specification"]["usrIdentifier"],
        "usrSubNetType" => logical_json["Network Resource Specification"]["usrSubNetType"],
        "password_prefix" => logical_json["Network Resource Specification"]["password_prefix"],
        "password_suffix" => logical_json["Network Resource Specification"]["password_suffix"],
        "simota_base_url" => logical_json["Network Resource Specification"]["simota_base_url"],
        "ims_pgw_endpoint" => logical_json["Network Resource Specification"]["ims_pgw_endpoint"],
        "srvStartDateTime" => logical_json["Network Resource Specification"]["srvStartDateTime"],
        "usrBillCycleDate" => logical_json["Network Resource Specification"]["usrBillCycleDate"],
        "password_gen_method" =>
          logical_json["Network Resource Specification"]["password_gen_method"],
        "ims_pgw_endpoint_pass" =>
          logical_json["Network Resource Specification"]["ims_pgw_endpoint_pass"],
        "ims_pgw_endpoint_user" =>
          logical_json["Network Resource Specification"]["ims_pgw_endpoint_user"],
        "network_service_names" => [
          logical_json["Network Resource Specification"]["network_service_names"]
        ]
      }
    }



  end

  @doc """
  Transforms logical Inter-account Transfer Specification JSON data into physical JSON data.

  ## Parameters

  - `logical_json` (map): The logical JSON data representing the inter-account transfer specification.

  ## Returns

  A map representing the physical JSON data.
  """

# Function for transforming Inter Acc




  def transform_inter_acc(logical_json) do
    %{
      "iax" => logical_json["Inter-account transfer specification"]
    }
end

 @doc """
  Transforms logical Policies JSON data into physical JSON data.

  ## Parameters

  - `logical_json` (map): The logical JSON data representing policies.

  ## Returns

  A map representing the physical JSON data.

  """

# Function for transforming policies

def transform_policies(logical_json) do
  %{
    "unit_info" => %{
      "triggers" => logical_json["Policies"]["triggers"],
      "policy_states" => logical_json["Policies"]["policy_states"],
      "initial_service_policy" => logical_json["Policies"]["initial_service_policy"]
    }
  }
end

  @doc """
  Transforms logical Recharge Specification JSON data into physical JSON data.

  ## Parameters

  - `logical_json` (map): The logical JSON data representing the recharge specification.

  ## Returns

  A map representing the physical JSON data.

  """

  # Function to transform logical data to physical data



  def transform_recharge_spec(logical_json) do
    %{
      "recharge" => %{
        "sms_mappings" => logical_json["Recharge specification"]["sms_mappings"],
        "data_mappings" => logical_json["Recharge specification"]["data_mappings"],
        "default_wallet" => logical_json["Recharge specification"]["default_wallet"],
        "voice_mappings" => logical_json["Recharge specification"]["voice_mappings"],
        "default_mappings" => logical_json["Recharge specification"]["default_mappings"]
      }
    }
  end

  ### Functions to transform Physical to Logical

  @doc """
  Transforms physical iax JSON data into logical JSON data.

  ## Parameters

  - `physical_json` (map): The physical JSON data representing the iax.

  ## Returns

  A map representing the logical JSON data mapped from the passed physical.

  """

def transform_iax(physical_data) do
  %{
    "Inter-account transfer specification" => physical_data["iax"]
  }
end

##########################################################################
 @doc """
  Transforms physical Service JSON data into logical JSON data.

  ## Parameters

  - `physical_json` (map): The physical JSON data representing the Service.

  ## Returns

  A map representing the logical JSON data mapped from the passed physical.

  """
def transform_Service_to_Network(physical_json) do
  logical_json = %{
    "Network Resource Specification" => %{
      "cc" => physical_json["service"]["cc"],
      "ims" => physical_json["service"]["ims"],
      "mcc" => physical_json["service"]["mcc"],
      "mnc" => physical_json["service"]["mnc"],
      # "ndc" => hphysical_json["service"]["ndc"]),
      "ndc" => physical_json["service"]["ndc"],
      # "tpl" => hd(physical_json["service"]["tpl"]),
      "tpl" => physical_json["service"]["tpl"],
      "vobb" => physical_json["service"]["vobb"],
      "hlrsn" => physical_json["service"]["hlrsn"],
      "sicap" => physical_json["service"]["sicap"],
      "access" => physical_json["service"]["access"],
      "simota" => physical_json["service"]["simota"],
      "srvName" => physical_json["service"]["srvName"],
      "usrState" => physical_json["service"]["usrState"],
      "ims_voice" => physical_json["service"]["ims_voice"],
      "snPatterns" => physical_json["service"]["snPatterns"],
      "usrExAttr1" => physical_json["service"]["usrExAttr1"],
      "vobb_realm" => physical_json["service"]["vobb_realm"],
      "ims_srvName" => physical_json["service"]["ims_srvName"],
      "ims_template" => physical_json["service"]["ims_template"],
      "usrIdentifier" => physical_json["service"]["usrIdentifier"],
      "usrSubNetType" => physical_json["service"]["usrSubNetType"],
      "password_prefix" => physical_json["service"]["password_prefix"],
      "password_suffix" => physical_json["service"]["password_suffix"],
      "simota_base_url" => physical_json["service"]["simota_base_url"],
      "ims_pgw_endpoint" => physical_json["service"]["ims_pgw_endpoint"],
      "srvStartDateTime" => physical_json["service"]["srvStartDateTime"],
      "usrBillCycleDate" => physical_json["service"]["usrBillCycleDate"],
      "password_gen_method" => physical_json["service"]["password_gen_method"],
      "ims_pgw_endpoint_pass" => physical_json["service"]["ims_pgw_endpoint_pass"],
      "ims_pgw_endpoint_user" => physical_json["service"]["ims_pgw_endpoint_user"],
      "network_service_names" => hd(physical_json["service"]["network_service_names"]),
      "default_quota" => physical_json["service"]["default_quota"],
      "xxxfinal_unit" => physical_json["service"]["xxxfinal_unit"],
      "vqt_percentage" => physical_json["service"]["vqt_percentage"],
      "threshold_notifications" => physical_json["service"]["threshold_notifications"],
      "Logical Resource" => physical_json["service"]["Logical Resource"],
      "Physical Resource" => physical_json["service"]["Physical Resource"],
      "Device" => physical_json["service"]["Device"]
    }
  }

  logical_json
end

#################################################################################

 # Transformation from physical to logical

  @doc """
  Transforms physical Policies JSON data into logical JSON data.

  ## Parameters

  - `physical_json` (map): The physical JSON data representing the Policies.

  ## Returns

  A map representing the logical JSON data mapped from the passed physical.

  """
 def transform_policies_physical(physical_data) do
  %{
    "Policies" => %{
      "triggers" => physical_data["unit_info"]["triggers"],
      "validityTime" => 900,
      "quotaHoldingTime" => 0,
      "timeQuotaThreshold" => 70,
      "unitQuotaThreshold" => 80,
      "policy_states" => physical_data["unit_info"]["policy_states"],
      "initial_service_policy" => physical_data["unit_info"]["initial_service_policy"]
    }
  }
end

########################################################################################

  # Transformation from physical to logical

   @doc """
  Transforms physical Recharge JSON data into logical JSON data.

  ## Parameters

  - `physical_json` (map): The physical JSON data representing the Recharge.

  ## Returns

  A map representing the logical JSON data mapped from the passed physical.

  """
  def transform_recharge_to_rechargespec(physical_data) do
    %{
      "Recharge specification" => %{
        "sms_mappings" => physical_data["recharge"]["sms_mappings"],
        "data_mappings" => physical_data["recharge"]["data_mappings"],
        "default_wallet" => physical_data["recharge"]["default_wallet"],
        "voice_mappings" => physical_data["recharge"]["voice_mappings"],
        "default_mappings" => physical_data["recharge"]["default_mappings"]
      }
    }
  end

end





# Sample Logical Json being passed for Transformation Rules to apply.
# Based on the code, the logical_json provided below will transform to Service in the physical.

# logical_json = %{
#   "Network Resource Specification" => %{
#     "cc" => "27",
#     "ims" => "8000",
#     "mcc" => "655",
#     "mnc" => "74",
#     "ndc" => "696",
#     "tpl" => "12",
#     "vobb" => true,
#     "hlrsn" => "1",
#     "sicap" => true,
#     "access" => "4G",
#     "simota" => "4001",
#     "srvName" => "4G_STAFF_MOBILE",
#     "usrState" => "1",
#     "ims_voice" => false,
#     "snPatterns" => "99",
#     "usrExAttr1" => "0",
#     "vobb_realm" => "rainmobile.co.za",
#     "ims_srvName" => "VOLTE_RAIN_PREMIUM",
#     "ims_template" => "ADD_VOLTE_MSR_SUP",
#     "usrIdentifier" => "usrMSISDN",
#     "usrSubNetType" => "0",
#     "password_prefix" => "",
#     "password_suffix" => "@raIn",
#     "simota_base_url" => "https://api.devops.rain.co.za",
#     "ims_pgw_endpoint" => "10.192.21.146:8080/spg",
#     "srvStartDateTime" => "CURRENT_DATETIME (GMT+2)",
#     "usrBillCycleDate" => "1",
#     "password_gen_method" => "Method1",
#     "ims_pgw_endpoint_pass" => "cnp200@HW",
#     "ims_pgw_endpoint_user" => "BSS_User",
#     "network_service_names" => "4G mobile standard staff",
#     "default_quota" => %{
#       "name" => "totalVolume",
#       "quota" => 268_435_456
#     },
#     "xxxfinal_unit" => %{
#       "finalUnitIndication" => %{
#         "finalUnitAction" => "TERMINATE"
#       }
#     },
#     "vqt_percentage" => 0.5,
#     "threshold_notifications" => [
#       %{
#         "p" => 99.999,
#         "name" => "4g_basic_100p",
#         "type" => "SMS"
#       },
#       %{
#         "p" => 80,
#         "name" => "4g_basic_80p",
#         "type" => "SMS"
#       },
#       %{
#         "p" => 50,
#         "name" => "4g_basic_50p",
#         "type" => "SMS"
#       }
#     ],
#     "Logical Resource" => [
#       %{
#         "isOperational" => "true",
#         "irStatus" => "initializing",
#         "serviceState" => "In service"
#       }
#     ],
#     "Physical Resource" => [
#       %{
#         "ManufactureDate" => "2012-07-29",
#         "otherIdentifier" => "10927476745",
#         "PowerState" => "Full power applied",
#         "serial number" => "98348937859355",
#         "version number" => "version 17.5"
#       }
#     ],
#     "Device" => [
#       %{
#         "type" => "mobile",
#         "manufacturer" => "rain",
#         "model" => "smartphone"
#       }
#     ]
#   }

# }
