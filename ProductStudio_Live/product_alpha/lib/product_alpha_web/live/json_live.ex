defmodule ProductAlphaWeb.JsonLive do
  # use ProductAlphaWeb, :live_view
  def transform_network_service(logical_json) do

# Mapping Rules For the Transformation
physical_json = %{
 "service" => %{
   "cc" => [logical_json[" Specification"]["cc"]],
   "ims" => logical_json[" Specification"]["ims"],
   "mcc" => [logical_json[" Specification"]["mcc"]],
   "mnc" => [logical_json[" Specification"]["mnc"]],
   "ndc" => [logical_json[" Specification"]["ndc"]],
   "tpl" => logical_json[" Specification"]["tpl"],
   "vobb" => logical_json[" Specification"]["vobb"],
   "hlrsn" => logical_json[" Specification"]["hlrsn"],
   "sicap" => logical_json[" Specification"]["sicap"],
   "access" => logical_json[" Specification"]["access"],
   "simota" => logical_json[" Specification"]["simota"],
   "srvName" => logical_json[" Specification"]["srvName"],
   "usrState" => logical_json[" Specification"]["usrState"],
   "ims_voice" => logical_json[" Specification"]["ims_voice"],
   "snPatterns" => [logical_json[" Specification"]["snPatterns"]],
   "usrExAttr1" => logical_json[" Specification"]["usrExAttr1"],
   "vobb_realm" => logical_json[" Specification"]["vobb_realm"],
   "ims_srvName" => logical_json[" Specification"]["ims_srvName"],
   "ims_template" => logical_json[" Specification"]["ims_template"],
   "usrIdentifier" => logical_json[" Specification"]["usrIdentifier"],
   "usrSubNetType" => logical_json[" Specification"]["usrSubNetType"],
   "password_prefix" => logical_json[" Specification"]["password_prefix"],
   "password_suffix" => logical_json[" Specification"]["password_suffix"],
   "simota_base_url" => logical_json[" Specification"]["simota_base_url"],
   "ims_pgw_endpoint" => logical_json[" Specification"]["ims_pgw_endpoint"],
   "srvStartDateTime" => logical_json[" Specification"]["srvStartDateTime"],
   "usrBillCycleDate" => logical_json[" Specification"]["usrBillCycleDate"],
   "password_gen_method" =>
     logical_json[" Specification"]["password_gen_method"],
   "ims_pgw_endpoint_pass" =>
     logical_json[" Specification"]["ims_pgw_endpoint_pass"],
   "ims_pgw_endpoint_user" =>
     logical_json[" Specification"]["ims_pgw_endpoint_user"],
   "network_service_names" => [
     logical_json[" Specification"]["network_service_names"]
   ]
 }
}

# Display the transformed JSON
IO.inspect(physical_json, pretty: true)

end



end
