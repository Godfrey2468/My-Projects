defmodule ProductAlphaWeb.PolicyLive do
  use ProductAlphaWeb, :live_view

  import Ecto.Query, warn: false
  import Ecto.Repo, warn: false

  alias ProductAlpha.Policies
  alias ProductAlpha.Policies.Policy

  alias ProductAlpha.Repo

  def mount(_params, _session, socket) do
    ref_schema = schema("GER")

  #   check = IO.inspect(ref_schema, custom_options: [sort_maps: true])
  #   IO.inspect(check)
  #   IO.inspect(get_policy(3))
       {:ok, assign(socket, :ref_schema,  ref_schema)}
 end




  def handle_event("load-schema", %{"code" => code}, socket) do
    ko = Jason.encode!(darastart())
  # IO.inspect(get_policy(3))
  #  IO.inspect(schema(code))
   rt =  Jason.encode!(schema(code))
    IO.inspect(load_json_data(code))
    ll = get_policy(3)
    ll.data
    # , sasa:  IO.inspect(ll.data )
    {:reply, %{schema: schema(code)}, socket}
  end






  def handle_event("submit", params, socket) do
    ref_schema = socket.assigns.ref_schema
    IO.inspect(params)
    ko = Jason.encode!(params)
   # IO.inspect(ko)
    case ExJsonSchema.Validator.validate(ref_schema, params) do
      :ok ->
       # {:ok, _policy} = insert_policy12(params)


        {:ok, _updated_policy} = update_policy(3, params) # Replace 1 with the actual ID of the policy

      # IO.inspect(Policies.create_policy(params))
        {:noreply, put_flash(socket, :info, "Success!")}

      {:error, _errors} ->
        {:noreply, put_flash(socket, :error, "Errors!")}
    end
  end


  # def handle_event("submit", %{"id" => id, "updated_data" => updated_data}, socket) do
  #   case update_policy(id, IO.inspect(updated_data)) do
  #     {:ok, _updated_policy} ->
  #       {:noreply, put_flash(socket, :info, "Success!")}

  #     {:error, _changeset} ->
  #       {:noreply, assign(socket, :error, "Failed to update data")}
  #   end
  # end



  defp insert_policy(params) do
    # Define the data to be inserted as a map
    data = %{"params" => params}

    # Insert the data into the database
    Repo.insert(%Policy{data: data})
  end


  def update_policy(id, updated_data) do
    policy = get_policy(id) # Use get_policy!/1 to raise an error if the policy is not found
    IO.inspect(policy)
    |> Ecto.Changeset.change(data: updated_data)
    |> Repo.update()
  end


  defp insert_policy12(data) do
    %ProductAlpha.Policies.Policy{} # Change to match your schema module
    |> Ecto.Changeset.change(data: data)
    |> Repo.insert()
  end

  @spec get_policy(any) :: any
  def get_policy(id) do
    Repo.get(ProductAlpha.Policies.Policy, id)
    # hata.data
  end


  defp darastart() do
    %{
           "Policies" => %{
           "triggers" => [
             %{
               "triggerType" => "QUOTA_THRESHOLD",
               "triggerCategory" => "IMMEDIATE_REPORT"
             },
             %{
               "triggerType" => "QUOTA_EXHAUSTED",
               "triggerCategory" => "IMMEDIATE_REPORT"
             },
             %{
               "triggerType" => "QHT",
               "triggerCategory" => "IMMEDIATE_REPORT"
             },
             %{
               "triggerType" => "VALIDITY_TIME",
               "triggerCategory" => "IMMEDIATE_REPORT"
             }
           ],
           "validityTime" => 900,
           "quotaHoldingTime" => 0,
           "timeQuotaThreshold" => 70,
           "unitQuotaThreshold" => 80,
           "policy_states" => [
             "High Speed",
             "RICA",
             "Device",
             "PP_OOB"
           ],
           "initial_service_policy" => %{
             "MASTER_POLICY" => %{
               "currentStatus" => "High Speed"
             }
           }
          }
         }

  end


  defp load_json_data("GER") do
    file_path = Application.app_dir(:product_alpha, "priv/testpol.json")

    case File.read(file_path) do
      {:ok, json_string} ->
          json_string

      {:error, _reason} ->
        {:error, "Failed to read JSON data from the file."}
    end
  end

  def countkey() do
   mapjson =  %{
      "type" => "object",
      "title" => "Policies",
      "properties" => %{
      "Policies" => %{
      "type" => "object",
      "properties" => %{
      "triggers" => %{
      "type" => "array",
      "format" => "table",
      "items" => %{
        "type"  => "object",
        "properties" => %{
          "triggerType" => %{
            "type" => "string"
          },
          "triggerCategory" => %{
            "type" => "string"
          }
        },
        "required" => [
          "triggerType",
          "triggerCategory"
        ]
      }
    },
    "validityTime" => %{
      "type" => "integer"
    },
    "quotaHoldingTime" => %{
      "type" => "integer"
    },
    "timeQuotaThreshold" => %{
      "type" => "integer"
    },
    "unitQuotaThreshold" => %{
      "type" => "integer"
    },
    "policy_states" => %{
      "type" => "array",
      "items" => %{
        "type" => "string"
      }
    },
    "initial_service_policy" => %{
      "type" => "object",
      "properties" => %{
        "MASTER_POLICY" => %{
          "type" => "object",
          "properties" => %{
            "currentStatus" => %{
              "type" => "string",
              "minLength" => 3,
            }
          },
          "required" => [
            "currentStatus"
          ]
        }
      },
      "required" => [
        "MASTER_POLICY"
      ]
    }
  },
  "required" => [
    "triggers",
    "validityTime",
    "quotaHoldingTime",
    "timeQuotaThreshold",
    "unitQuotaThreshold",
    "policy_states",
    "initial_service_policy"
  ]
  }
}
}

 list = Map.keys(mapjson)
 Enum.count(list)
 list
  end


  defp schema("GER") do
  # You'd probably load the schema from either your database
  # or a JSON file, but we'll simply hard-code it for now:
    %{
      "type" => "object",
      "title" => "Policies",
      "properties" => %{
      "Policies" => %{
      "type" => "object",
      "properties" => %{
      "triggers" => %{
      "type" => "array",
      "propertyOrder" => 0,
      "format" => "table",
      "items" => %{
        "type"  => "object",
        "properties" => %{
          "triggerType" => %{
            "type" => "string"
          },
          "triggerCategory" => %{
            "type" => "string"
          }
        },
        "required" => [
          "triggerType",
          "triggerCategory"
        ]
      }
    },
    "validityTime" => %{
      "type" => "integer",
      "propertyOrder" => 1
    },
    "quotaHoldingTime" => %{
      "type" => "integer",
      "propertyOrder" => 2
    },
    "timeQuotaThreshold" => %{
      "type" => "integer",
      "propertyOrder" => 3
    },
    "unitQuotaThreshold" => %{
      "type" => "integer",
      "propertyOrder" => 4
    },
    "policy_states" => %{
      "type" => "array",
      "propertyOrder" => 5,
      "items" => %{
        "type" => "string"
      }
    },
    "initial_service_policy" => %{
      "type" => "object",
      "propertyOrder" => 6,
      "properties" => %{
        "MASTER_POLICY" => %{
          "type" => "object",
          "properties" => %{
            "currentStatus" => %{
              "type" => "string",
              "minLength" => 3,
            }
          },
          "required" => [
            "currentStatus"
          ]
        }
      },
      "required" => [
        "MASTER_POLICY"
      ]
    }
  },
  "required" => [
    "triggers"
  ]
  }
}
}



end
end
