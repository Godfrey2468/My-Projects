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
import 'alpinejs'
import {InitModal} from "./init_modal"
import "flowbite/dist/flowbite.phoenix.js";
Hooks.InitModal = InitModal


// const liveSocket = new LiveSocket("/live");
liveSocket.connect();

const toggleMenu = () => {
  const nestedMenu = document.getElementById("nested-menu");
  if (nestedMenu) {
    if (nestedMenu.style.display === "none") {
      nestedMenu.style.display = "block";
    } else {
      nestedMenu.style.display = "none";
    }
  }
};

// Add an event listener for the toggle-menu action
document.addEventListener("click", (event) => {
  if (event.target.getAttribute("phx-click") === "toggle-menu") {
    toggleMenu();
  }
});

window.Alpine = Alpine
Alpine.start()

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}, dom: {
//   Keep Track of elements that alpine is attached to.
    onBeforeElUpdated(from, to) {
      if (from._x_dataStack) {
        window.Alpine.clone(from, to)
      }
    }
  }})

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


document.addEventListener("DOMContentLoaded", function () {
    const openModalButton = document.getElementById("openModalButton");
    const jsonModal = document.getElementById("jsonModal");
    const closeModal = document.getElementById("closeModal");
    const jsonTextarea = document.getElementById("jsonTextarea");
    const saveButton = document.getElementById("saveButton");
  
    openModalButton.addEventListener("click", function () {
      jsonModal.style.display = "block";
    });
  
    closeModal.addEventListener("click", function () {
      jsonModal.style.display = "none";
    });
  
    saveButton.addEventListener("click", function () {
      try {
        const editedJSON = JSON.parse(jsonTextarea.value);
        // You can send the edited JSON to the server using Ajax or other methods.
        console.log(editedJSON);
        jsonModal.style.display = "none";
      } catch (error) {
        alert("Invalid JSON. Please check your input.");
      }
    });
  
    window.addEventListener("click", function (event) {
      if (event.target === jsonModal) {
        jsonModal.style.display = "none";
      }
    });
  });


  export const InitModal = {
    mounted() {
      const handleOpenCloseEvent = event => {
        if (event.detail.open === false) {
          this.el.removeEventListener("modal-change", handleOpenCloseEvent)
  
          setTimeout(() => {
            // This timeout gives time for the animation to complete
            this.pushEventTo(event.detail.id, "close", {})
          }, 300);
        }
      }
  
      // This listens to modal event from AlpineJs
      this.el.addEventListener("modal-change", handleOpenCloseEvent)
  
      // This is the close event that comes from the LiveView
      this.handleEvent('close', data => {
        if (!document.getElementById(data.id)) return
  
        const event = new CustomEvent('close-now')
        this.el.dispatchEvent(event)
      })
    }
  }


  
  

