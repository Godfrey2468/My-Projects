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

// function loadSpectreStyles() {
//   // Create link elements for each CSS file
//   const cssFiles = [
//     "https://unpkg.com/spectre.css/dist/spectre.min.css",
//     "https://unpkg.com/spectre.css/dist/spectre-exp.min.css",
//     "https://unpkg.com/spectre.css/dist/spectre-icons.min.css"
//   ];

//   cssFiles.forEach(cssFile => {
//     const linkElement = document.createElement("link");
//     linkElement.rel = "stylesheet";
//     linkElement.href = cssFile;

//     // Append the link element to the HTML head
//     document.head.appendChild(linkElement);
//   });
//}

// Call the function to load the styles when needed
//  loadSpectreStyles();


export default {
    
    
    mounted() {
        var starting_value = {
            
                "product": [
                  {
                    "id": 1,
                    "productname": "5G",
                    "description": "More data and sms",
                    "price": "22.00",
                    "stock": "45.00"
                  },
                  {
                    "id": 10,
                    "productname": "4G Home1",
                    "description": "Data",
                    "price": "10.00",
                    "stock": "15.00"
                  },
                  {
                    "id": 9,
                    "productname": "4G Home",
                    "description": "offer more calls",
                    "price": "15.00",
                    "stock": "15.00"
                  },
                  {
                    "id": 11,
                    "productname": "4G Home 2",
                    "description": "Data",
                    "price": "10.00",
                    "stock": "12.00"
                  }
                ]
              
          };
        
        this.pushEvent("load-data", { code: "GER" }, (reply, ref) => {
            const editor = new JSONEditor(this.el, {
                ajax: true,
                schema:reply.schema, 
                // disable_collapse: true,
                // disable_edit_json: true,
                // disable_properties: true,
                // no_additional_properties: true,
                // The schema for the editor


            //  schema: {
                // "title": "Product",
                // "type": "object",
                //  "id": "product",
                // "properties": {
                //   "product": {
                //     "type": "array",
                //     "format": "table",
                //     "title": "Products",
                //     "uniqueItems": true,
                //     "items": {
                //       "type": "object",
                //       "properties": {
                //         "id": {
                //           "type": "number"
                //         },
                //         "productname": {
                //           "type": "string"
                //         },
                //         "description": {
                //           "type": "string"
                //         },
                //         "price": {
                //           "type": "string"
                //         },
                //         "stock": {
                //           "type": "string"
                //         }
                //       },
                //       "required": [
                //         "id"
                //       ]
                //     }
                //   }
                // },
                // "required": [
                //   "product"
                // ],
            //         format: "grid"
            //     },

                // Seed the form with a starting value
                startval: starting_value
            });

            document
                .getElementById("editor_holder")
                .addEventListener("click", () => {
                    const errors = editor.validate();
                    if (errors.length) {
                        editor.setOption("show_errors", "always");
                    } else {
                        editor.setOption("show_errors", "interaction");
                        this.pushEvent("submit", console.log(editor.getValue()));
                    }
                });
        });

    },
};    