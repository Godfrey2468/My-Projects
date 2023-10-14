defmodule JsonTransformerWeb.PageLive do
  use Phoenix.LiveView

  # def mount(_params, _session, socket) do
  #   {:ok, assign(socket, json: "", transformed_json: "")}
  # end

  # def render(assigns) do
  #   ~H"""
  #    <div>
  #     <h1>JSON Transformer</h1>
  #     <textarea phx-change="updateJson" id="jsonInput" placeholder="Enter JSON data" rows="10"></textarea>
  #     <button phx-click="transformJson">Transform</button>
  #   </div>
  #   <div>
  #     <h2>Transformed JSON</h2>
  #     <pre><code><%=  @transformed_json %></code></pre>
  #   </div>


  def render(assigns) do
    ~H"""
<!DOCTYPE html>
<html>
<head>
    <title>JSON Transformer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: vertical;
        }

        button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>JSON Transformer</h1>
        <div>
            <label for="jsonInput">Enter Logical JSON:</label>
            <textarea id="jsonInput" rows="10" cols="40"></textarea>
        </div>






        <div>
            <label for="transformedOutput">Transformed Physical JSON:</label>
            <textarea id="transformedOutput" rows="10" cols="40" readonly></textarea>
        </div>

        <button id="transformButton">Transform JSON</button>
        <%!-- <button id="transformButton">Download</button> --%>
        <button id="downloadButton" disabled>Download JSON</button>

    </div>

    <script>
        // Get references to the input and output elements
        const jsonInput = document.getElementById('jsonInput');
        const transformedOutput = document.getElementById('transformedOutput');
        const transformButton = document.getElementById('transformButton');

        // Add an event listener to the "Transform JSON" button
        transformButton.addEventListener('click', function () {
            try {
                // Parse the JSON from the input
                const inputJson = JSON.parse(jsonInput.value);
                // const inputJson1 = JSON.parse(jsonInput1.value);

                // Perform your transformation here
                const transformedJson = transformJson(inputJson);
                // const transformedJson1 = transformJson1(inputJson1);

                // Display the transformed JSON in the output textarea
                transformedOutput.value = JSON.stringify(transformedJson, null, 2);
                // transformedOutput1.value = JSON.stringify(transformedJson1, null, 2);
            } catch (error) {
                // Handle JSON parsing errors
                transformedOutput.value = 'Invalid JSON: ' + error;
            }
        });



        // Example transformation function
        function transformJson(inputJson) {
          const outputJson = {
          "service": {
          "cc": [inputJson["Network Resource Specification"]["cc"]],
          "ims": inputJson["Network Resource Specification"]["ims"],
          "mcc": [inputJson["Network Resource Specification"]["mcc"]],
          "mnc": [inputJson["Network Resource Specification"]["mnc"]],
          "ndc": [inputJson["Network Resource Specification"]["ndc"]],
          "tpl": inputJson["Network Resource Specification"]["tpl"],
          "vobb": inputJson["Network Resource Specification"]["vobb"],
          "hlrsn": inputJson["Network Resource Specification"]["hlrsn"],
          "sicap": inputJson["Network Resource Specification"]["sicap"],
          "access": inputJson["Network Resource Specification"]["access"],
          "simota": inputJson["Network Resource Specification"]["simota"],
          "srvName": inputJson["Network Resource Specification"]["srvName"],
          "usrState": inputJson["Network Resource Specification"]["usrState"],
          "ims_voice": inputJson["Network Resource Specification"]["ims_voice"],
          "snPatterns": [inputJson["Network Resource Specification"]["snPatterns"]],
          "usrExAttr1": inputJson["Network Resource Specification"]["usrExAttr1"],
          "vobb_realm": inputJson["Network Resource Specification"]["vobb_realm"],
          "ims_srvName": inputJson["Network Resource Specification"]["ims_srvName"],
          "ims_template": inputJson["Network Resource Specification"]["ims_template"],
          "usrIdentifier": inputJson["Network Resource Specification"]["usrIdentifier"],
          "usrSubNetType": inputJson["Network Resource Specification"]["usrSubNetType"],
          "password_prefix": inputJson["Network Resource Specification"]["password_prefix"],
          "password_suffix": inputJson["Network Resource Specification"]["password_suffix"],
          "simota_base_url": inputJson["Network Resource Specification"]["simota_base_url"],
          "ims_pgw_endpoint": inputJson["Network Resource Specification"]["ims_pgw_endpoint"],
          "srvStartDateTime": inputJson["Network Resource Specification"]["srvStartDateTime"],
          "usrBillCycleDate": inputJson["Network Resource Specification"]["usrBillCycleDate"],
          "password_gen_method": inputJson["Network Resource Specification"]["password_gen_method"],
          "ims_pgw_endpoint_pass": inputJson["Network Resource Specification"]["ims_pgw_endpoint_pass"],
          "ims_pgw_endpoint_user": inputJson["Network Resource Specification"]["ims_pgw_endpoint_user"],
          "network_service_names": [inputJson["Network Resource Specification"]["network_service_names"]]
  }
};

            return outputJson;




        }




    </script>
</body>
</html>

    """
  end


# <%!--

#     <!DOCTYPE html>
# <html lang="en">
#   <head>
#     <title>svelte-jsoneditor demo</title>
#     <style>
#       #jsoneditor {
#         width: 500px;
#         height: 300px;
#       }
#     </style>
#   </head>
#   <body>
#     <div id="jsoneditor"></div>

#     <script type="module">
#       import { JSONEditor } from 'https://cdn.jsdelivr.net/npm/vanilla-jsoneditor/index.js'

#       let content = {
#         text: undefined,
#         json: {
#           greeting: 'Hello World'
#         }
#       }

#       const editor = new JSONEditor({
#         target: document.getElementById('jsoneditor'),
#         props: {
#           content,
#           onChange: (updatedContent, previousContent, { contentErrors, patchResult }) => {
#             // content is an object { json: JSONValue } | { text: string }
#             console.log('onChange', { updatedContent, previousContent, contentErrors, patchResult })
#             content = updatedContent
#           }
#         }
#       })

#       // use methods get, set, update, and onChange to get data in or out of the editor.
#       // Use updateProps to update properties.
#     </script>
#     <div>
#       <h2>Transformed JSON</h2>
#       <pre><code><%= assigns.transformed_json %></code></pre>
#     </div>

#   </body>
# </html> --%>



  def handle_event("updateJson", %{"json" => json}, socket) do
    IO.inspect(json)
    {:noreply, assign(socket, json: json)}
  end

  def handle_event("transform", %{"json" => json}, socket) do
    try do
      input = Poison.decode!(json)
      output = transform_json(input)
      {:noreply, assign(socket, input: json, output: Poison.encode!(output))}
    catch
      _exception ->
        {:noreply, assign(socket, input: json, output: "Invalid JSON")}
    end
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, input: "", output: "")}
  end


  # def handle_event("transformJson", _, socket) do
  #   json = socket.assigns.json

  #   try do
  #     transformed_json = json
  #     |> Jason.decode!(json)
  #     |> transform_json() # Implement your JSON transformation logic here
  #     |> Jason.encode!(pretty: true)
  #     {:noreply, assign(socket, transformed_json: transformed_json)}
  #   catch
  #     _ -> {:noreply, socket} # Handle JSON decoding errors gracefully
  #   end
  # end

  # defp transform_json(json) do
  #   # Implement your JSON transformation logic here
  #   # This is just a placeholder example
  #   %{transformed: json}
  # end

  def transform_json(json) do
    # Replace the example transformation logic with the following:
    # json = %{
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


    new_json = %{
      "service" => %{
        "cc" => [json["cc"]],
        "ims" => json["ims"],
        "mcc" => [json["mcc"]],
        "mnc" => [json["mnc"], "38"],
        "ndc" => [json["ndc"]],
        "tpl" => json["tpl"],
        "vobb" => json["vobb"],
        "hlrsn" => json["hlrsn"],
        "sicap" => json["sicap"],
        "access" => json["access"],
        "simota" => json["simota"],
        "srvName" => json["srvName"],
        "usrState" => json["usrState"],
        "ims_voice" => json["ims_voice"],
        "snPatterns" => [json["snPatterns"]],
        "usrExAttr1" => json["usrExAttr1"],
        "vobb_realm" => json["vobb_realm"],
        "ims_srvName" => json["ims_srvName"],
        "ims_template" => json["ims_template"],
        "usrIdentifier" => json["usrIdentifier"],
        "usrSubNetType" => json["usrSubNetType"],
        "password_prefix" => json["password_prefix"],
        "password_suffix" => json["password_suffix"],
        "simota_base_url" => json["simota_base_url"],
        "ims_pgw_endpoint" => json["ims_pgw_endpoint"],
        "srvStartDateTime" => json["srvStartDateTime"],
        "usrBillCycleDate" => json["usrBillCycleDate"],
        "password_gen_method" => json["password_gen_method"],
        "ims_pgw_endpoint_pass" => json["ims_pgw_endpoint_pass"],
        "ims_pgw_endpoint_user" => json["ims_pgw_endpoint_user"],
        "network_service_names" => [json["network_service_names"]]
      }
    }

    new_json
    IO.inspect(new_json)
  end


end
