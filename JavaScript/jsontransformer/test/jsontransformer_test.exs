defmodule JsontransformerTest do
  use ExUnit.Case
  import Jsontransformer

  # Test case for logical_to_physical transformation
  test "transforms logical JSON to physical JSON" do
    # Original JSON data for testing
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


    expected_physical_json = %{
      "service" => %{
        "access" => "4G",
        "cc" => ["27"],
        "hlrsn" => "1",
        "ims" => "8000",
        "ims_pgw_endpoint" => "10.192.21.146:8080/spg",
        "ims_pgw_endpoint_pass" => "cnp200@HW",
        "ims_pgw_endpoint_user" => "BSS_User",
        "ims_srvName" => "VOLTE_RAIN_PREMIUM",
        "ims_template" => "ADD_VOLTE_MSR_SUP",
        "ims_voice" => false,
        "mcc" => ["655"],
        "mnc" => ["74"],
        "ndc" => ["696"],
        "network_service_names" => ["4G mobile standard staff"],
        "password_gen_method" => "Method1",
        "password_prefix" => "",
        "password_suffix" => "@raIn",
        "sicap" => true,
        "simota" => "4001",
        "simota_base_url" => "https://api.devops.rain.co.za",
        "snPatterns" => ["99"],
        "srvName" => "4G_STAFF_MOBILE",
        "srvStartDateTime" => "CURRENT_DATETIME (GMT+2)",
        "tpl" => "12",
        "usrBillCycleDate" => "1",
        "usrExAttr1" => "0",
        "usrIdentifier" => "usrMSISDN",
        "usrState" => "1",
        "usrSubNetType" => "0",
        "vobb" => true,
        "vobb_realm" => "rainmobile.co.za"
      }
    }

    actual_physical_json = Jsontransformer.transform_network_resource(logical_json)

    # Assert that the transformation produces the expected physical JSON
    assert expected_physical_json == actual_physical_json
  end

  test "transform_inter_acc/1" do
    logical_json = %{
      "Inter-account transfer specification" => "Some IAX Data"
    }

    expected_result = %{"iax" => "Some IAX Data"}
    assert transform_inter_acc(logical_json) == expected_result
  end

  test "transform_policies/1" do
    logical_json = %{
      "Policies" => %{
        "triggers" => "Triggers Data",
        "policy_states" => "Policy States Data",
        "initial_service_policy" => "Initial Service Policy Data"
      }
    }

    expected_result = %{
      "unit_info" => %{
        "triggers" => "Triggers Data",
        "policy_states" => "Policy States Data",
        "initial_service_policy" => "Initial Service Policy Data"
      }
    }

    assert transform_policies(logical_json) == expected_result
  end

  test "transform_recharge_spec/1" do
    logical_json = %{
      "Recharge specification" => %{
        "sms_mappings" => "SMS Mappings Data",
        "data_mappings" => "Data Mappings Data",
        "default_wallet" => "Default Wallet Data",
        "voice_mappings" => "Voice Mappings Data",
        "default_mappings" => "Default Mappings Data"
      }
    }

    expected_result = %{
      "recharge" => %{
        "sms_mappings" => "SMS Mappings Data",
        "data_mappings" => "Data Mappings Data",
        "default_wallet" => "Default Wallet Data",
        "voice_mappings" => "Voice Mappings Data",
        "default_mappings" => "Default Mappings Data"
      }
    }

    assert transform_recharge_spec(logical_json) == expected_result
  end


end
