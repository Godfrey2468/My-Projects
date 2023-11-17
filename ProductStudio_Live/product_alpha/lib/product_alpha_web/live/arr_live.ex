defmodule ProductAlphaWeb.ArrLive do
  use ProductAlphaWeb, :live_view

  def mount(_params, _session, socket) do
    ref_schema = schema("GER")

      {:ok, assign(socket, :ref_schema, ref_schema)}
 end

  def handle_event("load-arr", %{"code" => code}, socket) do
   {:reply, %{schema: schema(code), startt: startmine()}, socket}
 end

 defp startmine() do
   %{
    "products" => [
      "4G Home",
      "3G Home",
      "5G Home"
    ],
    "services" => [
      %{
        "ServiceName" => "Data",
        "ServiceProvider" => true
      },
      %{
        "ServiceName" => "Sms",
        "ServiceProvider" => false
      }
    ]
   }
 end

 defp schema("GER") do
   %{
     "title" => "Products and Service list",
     "type" => "object",
     "properties" => %{
       "products" => %{
        "type" => "array",
        "title" => "Products",
        "items" => %{
          "type" => "string"
        }
       },
       "services" => %{
        "type" => "array",
        "title" => "Services",
        "items" => %{
          "type" => "object",
           "properties" => %{
            "ServiceName" => %{
              "type" => "string",
              "description" => "The name of the vegetable."
            },
            "ServiceProvider" => %{
              "type" => "boolean",
              "description" => "Do i like vegie."
            }
           }
        }
       }
     }
   }
 end

#  defp schema("GER") do
#   # You'd probably load the schema from either your database
#   # or a JSON file, but we'll simply hard-code it for now:
#   %{
#     "title" => "Product",
#     "type"=> "object",
#      "id"=>"product",
#     "properties"=> %{
#       "product"=> %{
#         "type" => "array",
#         "format"=> "table",
#         "title"=> "Products",
#         "uniqueItems"=> true,
#         "items"=> %{
#           "type" => "object",
#           "properties" => %{
#             "id" => %{
#               "type" => "number"
#             },
#             "productname" => %{
#               "type" => "string"
#             },
#             "description" => %{
#               "type" => "string"
#             },
#             "price" => %{
#               "type" => "string"
#             },
#             "stock" => %{
#               "type" => "string"
#             }
#           },
#           "required" => [
#             "id"
#           ]
#         }
#       }
#     },
#     "required" => [
#       "product"
#     ]

#   }
#   end

end
