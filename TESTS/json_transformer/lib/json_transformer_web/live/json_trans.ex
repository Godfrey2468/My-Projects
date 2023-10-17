defmodule JsonTransformerWeb.JsonTrans do

   def network_service(logical_json) do
# Original JSON data
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

# Transformation code
physical_json = %{
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

# Display the transformed JSON
IO.inspect(physical_json, pretty: true)

 end


end