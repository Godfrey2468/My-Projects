defmodule JSONTransformer2Test do
  use ExUnit.Case

  # Define a test case for the transform_logical_to_physical function
  test "transforms logical JSON to physical JSON" do
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

    expected_physical_data = %{
      "Service" => %{
        "password_suffix" => "@raIn",
        "cc" => "27",
        "ims_template" => "ADD_VOLTE_MSR_SUP",
        "Logical Resource" => [
          %{
            "irStatus" => "initializing",
            "isOperational" => "true",
            "serviceState" => "In service"
          }
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
        "xxxfinal_unit" => %{
          "finalUnitIndication" => %{"finalUnitAction" => "TERMINATE"}
        },
        "mcc" => "655",
        "ims_voice" => false,
        "simota_base_url" => "https://api.devops.rain.co.za",
        "usrSubNetType" => "0",
        "usrIdentifier" => "usrMSISDN",
        "Device" => [
          %{"manufacturer" => "rain", "model" => "smartphone", "type" => "mobile"}
        ],
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

    # Call the transform_logical_to_physical function
    physical_data = JSONTransformer2.transform_logical_to_physical(logical_data)

    # Assert that the transformed data matches the expected physical data
    assert physical_data == expected_physical_data
  end
end
