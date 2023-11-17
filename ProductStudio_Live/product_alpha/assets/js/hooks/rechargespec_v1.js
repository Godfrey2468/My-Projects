import { JSONEditor } from "../../vendor/jsoneditor";
//JSONEditor.defaults.options.theme = "tailwind";

// Create three link elements
const link1 = document.createElement('link');
const link2 = document.createElement('link');
const link3 = document.createElement('link');
const link4 = document.createElement('link');

// Set the attributes for each link element
link1.rel = 'stylesheet';
link1.href = 'https://unpkg.com/spectre.css/dist/spectre.min.css';

link2.rel = 'stylesheet';
link2.href = 'https://unpkg.com/spectre.css/dist/spectre-exp.min.css';

link3.rel = 'stylesheet';
link3.href = 'https://unpkg.com/spectre.css/dist/spectre-icons.min.css';

link4.rel = 'stylesheet';
link4.href = 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css'
  // Set the default CSS theme and icon library globally

  // Create a new script element for the Bootstrap JavaScript bundle
var bootstrapJs = document.createElement('script');
bootstrapJs.src = 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js';
bootstrapJs.integrity = 'sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe';
bootstrapJs.crossOrigin = 'anonymous';

// Append the Bootstrap CSS and JavaScript to the document's head
// document.head.appendChild(bootstrapCss);
document.head.appendChild(bootstrapJs);


//Append the link elements to the head of the document 
  //document.head.appendChild(link1);
  document.head.appendChild(link2);
  document.head.appendChild(link3);
  document.head.appendChild(link4);

 JSONEditor.defaults.options.theme = "bootstrap5";

 // JSONEditor.defaults.theme = 'spectre';
 JSONEditor.defaults.iconlib = 'spectre';

//JSONEditor.defaults.theme = 'foundation5';
//JSONEditor.defaults.iconlib = 'fontawesome4';

export default {
    mounted() {
      this.pushEvent("load-schema", { code: "GER" }, (reply, ref) => {
       
        const editor = new JSONEditor(this.el, {
          schema: reply.schema,
          startval: reply.rechargespe,
          disable_collapse: false,
          disable_edit_json: false,
          disable_properties: false,
          no_additional_properties: true,
        });
        console.log(reply.sasa);
        document
          .getElementById("json-schema-form-submit")
          .addEventListener("click", () => {
            const errors = editor.validate();
            if (errors.length) {
              editor.setOption("show_errors", "always");
            } else {
              editor.setOption("show_errors", "interaction");
              this.pushEvent("submit", editor.getValue());
              console.log("working")
            }
          });
      });
    },
  };