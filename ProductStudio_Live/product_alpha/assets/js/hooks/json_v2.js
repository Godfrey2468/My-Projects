import { JSONEditor } from 'vanilla-jsoneditor'

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

      
      const content = {
        text: undefined, // used in text mode
         json: {
           array: [1, 2, 3],
           boolean: true,
           color: '#82b92c',
           null: null,
           number: 123,
           object: { a: 'b', c: 'd' },
           time: 1575599819000,
           string: 'Hello World'
         }
       }
       const content1 = {
        json: {
          firstName: 'John',
          lastName: 'Doe',
          gender: null,
          age: '28',
          availableToHire: true,
          job: {
            company: 'freelance',
            role: 'developer',
            salary: 100
          }
        },
        text: undefined
      }
       const editor = new JSONEditor({
        target: document.getElementById('jsoneditor')
      });
       
       //editor.set(content)
       document
       .getElementById("editor_holder_v2")
       .addEventListener("click", (event) => {
        event.preventDefault()
      const content = editor.set(content1)
                
              // this.pushEvent("submit1", console.log(editor.set(content1)));
               console.log(editor.get())
       }); 

       document
       .getElementById("getContent1")
       .addEventListener("click", () => {
        
        const content = editor.get()
        alert(JSON.stringify(content, null, 2))
            //    this.pushEvent("submit1", console.log(editor.set(content1)));
            //    console.log(editor.get())
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

       this.pushEvent("load-hata", { code: "GER" }, (reply, ref) => {
        // const editor = new JSONEditor(this.el, {
        //     ajax: true,
        //     schema:reply.schema, 
        //     startval: starting_value
        // });

        editor.set(console.log(reply.schema))

         });

        //this.pushEvent("load-hata", { code: "GER" }, (reply, ref) => {
        //    const editor = new JSONEditor(this.el);
          

           // editor.set(starting_value)

       ////    editor.set(content)


            // document
            //     .getElementById("editor_holder")
            //     .addEventListener("click", () => {
            //         const errors = editor.validate();
            //         if (errors.length) {
            //             editor.setOption("show_errors", "always");
            //         } else {
            //             editor.setOption("show_errors", "interaction");
            //             this.pushEvent("submit", console.log(editor.getValue()));
            //         }
            //     });
       // });

// create the editor
// const editor = new JSONEditor({
//   target: document.getElementById('jsoneditor')
// })

// set json

// document.getElementById('setContent').onclick = function () {
//   const content = {
//     text: undefined, // used in text mode
//     json: {
//       array: [1, 2, 3],
//       boolean: true,
//       color: '#82b92c',
//       null: null,
//       number: 123,
//       object: { a: 'b', c: 'd' },
//       time: 1575599819000,
//       string: 'Hello World'
//     }
//   }

//   editor.set(content)
// }


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

// get json
// document.getElementById('getContent').onclick = function () {
//   const content = editor.get()
//   alert(JSON.stringify(content, null, 2))
// }
},
};  