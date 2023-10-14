# The transformation outlined here applies specifically to the second level of objects in a JSON structure.
# In this transformation, the second-level objects in the logical representation must be mapped to their corresponding second-level objects in the physical representation.
# Define a function to transform logical JSON data into physical JSON data
defmodule JSONTransformer2 do
  @spec transform_logical_to_physical(logical_json :: map()) :: map()
  def transform_logical_to_physical(logical_json) do
    # Below Physical json map with pre defined attributes not being mapped from the logical.

    physical_json = %{

    }

    # Implement your transformation logic here
    # For example, you can iterate through the logical_json and transform it

    # Sample transformation:

    # physical_json =
    # Map.update(physical_json, :Teriff_Plan, logical_json["Product Specification"], fn
    #  current_value when is_binary(current_value) ->
    #   current_value + 1
    # _ -> 20  # Default value if key doesn't exist or value is not an integer
    # end)

    physical_json =
      Map.update(physical_json, "Service", logical_json["Network Resource Specification"], fn
        current_value when is_binary(current_value) ->
          current_value + 1
          # _ -> 20  # Default value if key doesn't exist or value is not an integer
      end)

    # physical_json =
    #  Map.update(physical_json, :Service_Provider, logical_json["log"], fn
    #   current_value when is_binary(current_value) -> "Physical: " <> current_value
    # Default value if key doesn't exist or value is not a binary
    #  _ -> "Default"
    # end)

    #physical_json =
     # Map.update(
        #physical_json,
       # %{"meta" => "Recharge"},
       # logical_json["Recharge Specification"],
        #fn
        #  current_value when is_binary(current_value) -> "" <> current_value
          # Default value if key doesn't exist or value is not a binary
       #   _ -> "Default"
     #   end
      #)

    #physical_json =
      #Map.update(physical_json, %{"meta" => "IAX"}, logical_json["Inter-Acc trans Spec"], fn
       # current_value when is_binary(current_value) -> "Physical: " <> current_value
        # Default value if key doesn't exist or value is not a binary
      #  _ -> "Default"
     # end)

    # physical_json =
    # Map.update(physical_json, :Policies, logical_json["Policies"], fn
    # current_value when is_binary(current_value) -> "Physical: " <> current_value
    # Default value if key doesn't exist or value is not a binary
    # _ -> "Default"
    # end)

    physical_json
  end
end

# Example usage of the transformation function
logical_data = %{
  "Network Resource Specification" => %{
    "password_suffix" => "@raIn",
    "cc" => "27",
    "ims_template" => "ADD_VOLTE_MSR_SUP",
    "Logical Resource" => [
      %{"irStatus" => "initializing", "isOperational" => "true", "serviceState" => "In service"}
    ],
    "threshold_notifications" => [
      %{"name" => "4g_basic_100p", "p" => 99.999, "type" => "SMS"},
      %{"name" => "4g_basic_80p", "p" => 80, "type" => "SMS"},
      %{"name" => "4g_basic_50p", "p" => 50, "type" => "SMS"}
    ],
    "access" => "4G",
    "tpl" => "12",
    "sicap" => true,
    "vobb" => true,
    "ims" => "8000",
    "hlrsn" => "1",
    "mnc" => "74",
    "vobb_realm" => "rainmobile.co.za",
    "xxxfinal_unit" => %{"finalUnitIndication" => %{"finalUnitAction" => "TERMINATE"}},
    "mcc" => "655",
    "ims_voice" => false,
    "simota_base_url" => "https://api.devops.rain.co.za",
    "usrSubNetType" => "0",
    "usrIdentifier" => "usrMSISDN",
    "Device" => [%{"manufacturer" => "rain", "model" => "smartphone", "type" => "mobile"}],
    "ims_pgw_endpoint" => "10.192.21.146:8080/spg",
    "network_service_names" => "4G mobile standard staff",
    "password_gen_method" => "Method1",
    "ims_pgw_endpoint_user" => "BSS_User",
    "Physical Resource" => [
      %{
        "ManufactureDate" => "2012-07-29",
        "PowerState" => "Full power applied",
        "otherIdentifier" => "10927476745",
        "serial number" => "98348937859355",
        "version number" => "version 17.5"
      }
    ],
    "usrExAttr1" => "0",
    "default_quota" => %{"name" => "totalVolume", "quota" => 268435456},
    "srvStartDateTime" => "CURRENT_DATETIME (GMT+2)",
    "vqt_percentage" => 0.5,
    "ims_pgw_endpoint_pass" => "cnp200@HW",
    "password_prefix" => "",
    "simota" => "4001",
    "usrBillCycleDate" => "1",
    "ndc" => "696",
    "srvName" => "4G_STAFF_MOBILE",
    "usrState" => "1",
    "snPatterns" => "99",
    "ims_srvName" => "VOLTE_RAIN_PREMIUM"
  }
}

# Service Provider has no mapping to the Physical data

# Policies transform rule not applied yet as policies split a lot in the physical

physical_data = JSONTransformer2.transform_logical_to_physical(logical_data)

# The transformation implemented here is only for the level 2 objects in the json

# Naming will be transformed
# Values will remail.

# Display the physical data
IO.puts("Physical JSON Data:")

IO.inspect(physical_data)
