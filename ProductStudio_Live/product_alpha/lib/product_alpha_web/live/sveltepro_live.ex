defmodule ProductAlphaWeb.SvelteproLive do
  use ProductAlphaWeb, :live_view


  def mount(_params, _session, socket) do
    ref_schema = schema("GER")

       {:ok, assign(socket, :ref_schema, 3)}
 end


 def handle_event("load-hata", %{"code" => code}, socket) do
  {:reply, %{schema: schema(code)}, socket}
end
#def handle_event("submit1", _params, socket) do


  # ref_schema = socket.assigns.ref_schema

  #  case ExJsonSchema.Validator.validate(ref_schema, params) do
  #  :ok ->
  #   {:noreply, put_flash(socket, :info, "Success!")}

  #  {:error, _errors} ->
  #    {:noreply, put_flash(socket, :error, "Errors!")}
  #  end
  #  {:noreply, put_flash(socket, :info, "Success!")}


#end
# defp schema("GER") do
#  %{
#   title: 'Employee',
#   description: 'Object containing employee details',
#   type: 'object',
#   properties: {
#     firstName: {
#       title: 'First Name',
#       description: 'The given name.',
#       examples: ['John'],
#       type: "string"
#     },
#     lastName: {
#       title: 'Last Name',
#       description: 'The family name.',
#       examples: ['Smith'],
#       type: 'string'
#     },
#     gender: {
#       title: 'Gender',
#       enum: ['male', 'female']
#     },
#     availableToHire: {
#       type: 'boolean',
#       default: false
#     },
#     age: {
#       description: 'Age in years',
#       type: 'integer',
#       minimum: 0,
#       examples: [28, 32]
#     }
#   },
#   required: ['firstName', 'lastName']
# }
# end

defp schema("GER") do
  # You'd probably load the schema from either your database
  # or a JSON file, but we'll simply hard-code it for now:
  %{
    "title" => "Product",
    "type"=> "object",
     "id"=>"product",
    "properties"=> %{
      "product"=> %{
        "type" => "array",
        "format"=> "table",
        "title"=> "Products",
        "uniqueItems"=> true,
        "items"=> %{
          "type" => "object",
          "properties" => %{
            "id" => %{
              "type" => "number"
            },
            "productname" => %{
              "type" => "string"
            },
            "description" => %{
              "type" => "string"
            },
            "price" => %{
              "type" => "string"
            },
            "stock" => %{
              "type" => "string"
            }
          },
          "required" => [
            "id"
          ]
        }
      }
    },
    "required" => [
      "product"
    ]

  }
end

end
