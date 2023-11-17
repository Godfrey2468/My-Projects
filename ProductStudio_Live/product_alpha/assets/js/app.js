// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"
import JsonV1 from "./hooks/json_v1"
import JsonV2 from "./hooks/json_v2"
import JsonV3arr from "./hooks/json_v3arr"
import WalletconV1 from "./hooks/walletcon_v1"
import PolicyV1 from "./hooks/policy_v1"
import ServiceprovV1 from "./hooks/serviceprov_v1"
import NwtworkresourceV1 from "./hooks/networkresource_v1"
import RechargespecV1 from "./hooks/rechargespec_v1"
import InteraccountV1 from "./hooks/interaccount_v1"
import ProductpriceV1 from "./hooks/productprice_v1"
import AdditionalwalletV1 from "./hooks/additionalwallet_v1"
import BasepriceV1 from "./hooks/baseprice_v1"
import SubcriptionbillV1 from "./hooks/subscriptionbill_v1"
import DiscountsV1 from "./hooks/discounts_v1"
import ConsumptionbillV1 from "./hooks/consumptionbill_v1"
import SmsmapV1 from "./hooks/smsmap_v1"
import DatamapV1 from "./hooks/datamap_v1"
import VoicemapV1 from "./hooks/voicemap_v1"
import DefaultmapV1 from "./hooks/defaultmap_v1"
import DefaultrecV1 from "./hooks/defaultrec_v1"
import TriggersV1 from "./hooks/triggers_v1"
import PolicystateV1 from "./hooks/policystate_v1"
import IntialserviceV1 from "./hooks/intialservice_v1"
import ThresholdV1 from "./hooks/threshold_v1"
import SpecificationV1 from "./hooks/specification_v1"
import NotificationV1 from "./hooks/notification_v1"
import ResourcesV1 from "./hooks/resources_v1"
import BasepriceV2 from "./hooks/baseprice_v2"
import SubcriptionbillV2 from "./hooks/subscriptionbill_v2"
import DiscountsV2 from "./hooks/discounts_v2"
import ConsumptionbillV2 from "./hooks/consumptionbill_v2"
import SpecificationV2 from "./hooks/specification_v2"
import NotificationV2 from "./hooks/notification_v2"
import ResourcesV2 from "./hooks/resources_v2"
import ServiceprovV2 from "./hooks/serviceprov_v2"
import sami_v1 from "./hooks/sami_v1"

let Hooks = {};
Hooks.JsonV1 = JsonV1;
Hooks.JsonV2 = JsonV2;
Hooks.JsonV3arr = JsonV3arr;
Hooks.WalletconV1 = WalletconV1;
Hooks.PolicyV1 = PolicyV1;
Hooks.ServiceprovV1 = ServiceprovV1;
Hooks.NwtworkresourceV1 = NwtworkresourceV1;
Hooks.RechargespecV1 = RechargespecV1;
Hooks.InteraccountV1 = InteraccountV1;
Hooks.ProductpriceV1 = ProductpriceV1;
Hooks.AdditionalwalletV1 = AdditionalwalletV1;
Hooks.BasepriceV1 = BasepriceV1;
Hooks.SubcriptionbillV1 = SubcriptionbillV1;
Hooks.DiscountsV1 = DiscountsV1;
Hooks.ConsumptionbillV1 = ConsumptionbillV1;
Hooks.SmsmapV1 = SmsmapV1;
Hooks.DatamapV1 = DatamapV1;
Hooks.VoicemapV1 = VoicemapV1;
Hooks.DefaultmapV1 = DefaultmapV1;
Hooks.DefaultrecV1 = DefaultrecV1;
Hooks.TriggersV1 = TriggersV1;
Hooks.PolicystateV1 = PolicystateV1;
Hooks.IntialserviceV1 = IntialserviceV1;
Hooks.ThresholdV1 = ThresholdV1;
Hooks.SpecificationV1 = SpecificationV1;
Hooks.NotificationV1 = NotificationV1;
Hooks.ResourcesV1 = ResourcesV1;
Hooks.BasepriceV2 = BasepriceV2;
Hooks.SubcriptionbillV2 = SubcriptionbillV2;
Hooks.DiscountsV2 = DiscountsV2;
Hooks.ConsumptionbillV2 = ConsumptionbillV2;
Hooks.SpecificationV2 = SpecificationV2;
Hooks.NotificationV2 = NotificationV2;
Hooks.ResourcesV2 = ResourcesV2;
Hooks.ServiceprovV2 = ServiceprovV2;
Hooks.sami_v1 = sami_v1


import "flowbite/dist/flowbite.phoenix.js";

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}, hooks: Hooks})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

