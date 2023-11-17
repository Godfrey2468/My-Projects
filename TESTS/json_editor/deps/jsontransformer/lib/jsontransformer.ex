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

end

# Sample Logical Json being passed for Transformation Rules to apply.
# Based on the code, the logical_json provided below will transform to Service in the physical.

logical_json = %{
  "Network Resource Specification" => %{
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





# call transforming function and pass data to be transformed
physical_json = Jsontransformer.transform_network_resource(logical_json)
# Display the transformed JSON
IO.inspect(physical_json, pretty: true)

###################################################################################

#
physical_json = Jsontransformer.transform_inter_acc(logical_json)
#
IO.inspect(physical_json, pretty: true)

#########################################

physical_json = Jsontransformer.transform_policies(logical_json)

IO.inspect(physical_json, pretty: true)

##########################################
physical_json = Jsontransformer.transform_recharge_spec(logical_json)

# Print the resulting physical data
IO.inspect(physical_json, pretty: true)

############################################
