defmodule ProductAlphaWeb.ProductsLive do
  use ProductAlphaWeb, :live_view

  #alias ProductstudioWeb.Validator.JsonValidator


  # def mount(_params, _session, socket) do
  #   {:ok, assign(socket, :number, 7)}
  #  end

  # def mount(_params, _session, socket) do
  #  # ref_schema = ExJsonSchema.Schema.resolve(schema())

  #   {:ok, assign(socket, :ref_schema, JsonValidator.schema())}
  # end

  def mount(_params, _session, socket) do
     ref_schema = schema("GER")

       {:ok, assign(socket, :ref_schema, ref_schema)}
  end




   def handle_event("load-data", %{"code" => code}, socket) do
    {:reply, %{schema: schema(code)}, socket}
  end


  def handle_event("submit",params, socket) do


    ref_schema = socket.assigns.ref_schema

     case ExJsonSchema.Validator.validate(ref_schema, params) do
     :ok ->
      {:noreply, put_flash(socket, :info, "Success!")}

     {:error, _errors} ->
       {:noreply, put_flash(socket, :error, "Errors!")}
     end
      #  {:noreply, put_flash(socket, :info, "Success!")}


  end

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
    # "type" => "object",
    # "properties" => %{
    #   "name" => %{
    #     "type" => "string",
    #     "minLength" => 1,
    #     "maxLength" => 5
    #   },
    #   "description" => %{
    #     "type" => "string",
    #     "minLength" => 1,
    #     "maxLength" => 1000
    #   },
    #   "price" => %{
    #     "type" => "number",
    #     "minimum" => 0.01
    #   },
    #   "stock" => %{
    #     "type" => "integer",
    #     "minimum" => 0
    #   }
    # },
    # "required" => ["name", "price", "stock"]
  }
  end

end
