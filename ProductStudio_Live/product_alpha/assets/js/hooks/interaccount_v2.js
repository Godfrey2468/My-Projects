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
      this.pushEvent("load-schema14", { code: "GER" }, (reply, ref) => {
       
        const editor = new JSONEditor(this.el, {
          schema: reply.schema14,
          startval: reply.interacc,
          disable_collapse: false,
          disable_edit_json: false,
          disable_properties: false,
          no_additional_properties: true,
        });
        console.log(reply.sasa);
        document
          .getElementById("json-schema-form-submit14")
          .addEventListener("click", () => {
            const errors = editor.validate();
            if (errors.length) {
              editor.setOption("show_errors", "always");
            } else {
              editor.setOption("show_errors", "interaction");
              this.pushEvent("submit14", editor.getValue());
              console.log("working")
            }
          });


          // for save and collapse
          editor.on('ready',function() {


            var button1 = editor.root.getButton('Save Result As File', 'save', 'Save Result As File'),
            button_holder = editor.root.theme.getHeaderButtonHolder();
            button_holder.appendChild(button1);
            editor.root.header.parentNode.insertBefore(button_holder, editor.root.header.nextSibling);
          
            button1.addEventListener('click', function(e) {
              e.preventDefault();
              var example = editor.getValue(),
              filename = 'hata.json',
              blob = new Blob([JSON.stringify(example, null, 2)], {
                type: "application/json;charset=utf-8"
              });
          
              if (window.navigator && window.navigator.msSaveOrOpenBlob) {
                window.navigator.msSaveOrOpenBlob(blob, filename);
              } else {
                var a = document.createElement('a');
                a.download = filename;
                a.href = URL.createObjectURL(blob);
                a.dataset.downloadurl = ['text/plain', a.download, a.href].join(':');
          
                a.dispatchEvent(new MouseEvent('click', {
                  'view': window,
                  'bubbles': true,
                  'cancelable': false
                }));
              }
            }, false);




            // Create buttom and insert it after the root header
            var button = editor.root.getButton('Collapse All','collapse','Collapse All');
            button.value = '1';
            var button_holder = editor.root.theme.getHeaderButtonHolder();
            button_holder.appendChild(button);
            editor.root.header.parentNode.insertBefore(button_holder, editor.root.header.nextSibling);
          
            // document
            // .getElementById("godfrey")
            // .addEventListener('click', function(e) {
              button.addEventListener('click', function(e) {
              e.preventDefault();
              e.stopPropagation();
          
              // Toggle the value on the button
              this.value = this.value == '1' ? '0' : '1';
          
              // Change the text/icon on the button
              if (this.value == '1') {
                // Expand
                editor.root.setButtonText(this,'Collapse All','collapse','Collapse All');
              }
              else {
                // Collapse
                editor.root.setButtonText(this,'Expand All','expand','Expand All');
              }
          
              // Loop through all jseditors
              for (var key in editor.editors) {
                if (editor.editors.hasOwnProperty(key)) {
                  var ed = editor.editors[key];
                  console.log('ed.schema.type)',ed.schema.type);
                  
                  if (['array', 'object'].indexOf(ed.schema.type) !== -1 && ed.editor_holder) {
                    if (this.value == '1') {
                      // Expand
                      ed.editor_holder.style.display = '';
                      ed.collapsed = false;
                      ed.setButtonText(ed.toggle_button,'','collapse',ed.translate('button_collapse'));
                    }
                    else {
                      // Collapse
                      ed.editor_holder.style.display = 'none';
                      ed.collapsed = true;
                      ed.setButtonText(ed.toggle_button,'','expand',ed.translate('button_expand'));
                    }
                  }
                }
              }
          
            },false);
          
          });
      });
    },
  };