import VanillaJSONEditor from "./VanillaJSONEditor";
import React, { useEffect, useRef, useState } from "react";
import "./styles.css";


export default function App() {
  const [showEditor, setShowEditor] = useState(true);
  const [readOnly, setReadOnly] = useState(false);
  const fileInputRef = useRef(null);
  const [content, setContent] = useState({
    json: {
      greeting: "Hello World",
      color: "#ff3e00",
      ok: true,
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    },
    text: undefined
  });


  const saveToLocalStorage = () => {
    localStorage.setItem('personData', JSON.stringify(content));
    alert('JSON object saved to local storage!');
  };

  const retrieveFromLocalStorage = () => {
    const storedPersonJSONString = localStorage.getItem('personData');
    if (storedPersonJSONString) {
      const storedPerson = JSON.parse(storedPersonJSONString);
      alert(`Retrieved JSON object: ${JSON.stringify(storedPerson)}`);
    } else {
      alert('No JSON object found in local storage.');
    }
  };

  const saveJsonToFile = () => {
    //localStorage.setItem("json staff", jsonData);
 // const kk = setContent(content)

    const jsonContent = JSON.stringify(content, null, 2);
    const blob = new Blob([jsonContent], { type: "application/json" });
   
    
    // Create a URL for the Blob and create a download link
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "my_json_file.json";

    // Programmatically click the link to trigger the download
    a.click();

      // Clean up by revoking the Blob URL
      URL.revokeObjectURL(url)
  };


  const handleFileChange = (event) => {
    const file = event.target.files[0];
    if (!file) return;
  
    const reader = new FileReader();
  
    reader.onload = (e) => {
      try {
        const uploadedContent = JSON.parse(e.target.result);
        setContent(uploadedContent);
        console.log("Uploaded JSON content:", uploadedContent); // Added for debugging
      } catch (error) {
        console.error("Error parsing uploaded JSON:", error);
      }
    };
  
    reader.readAsText(file);
  };
  
    

  return (
    <div className="App">
      <h1>svelte-jsoneditor in React</h1>
      <p>
        <label>
          <input
            type="checkbox"
            checked={showEditor}
            onChange={() => setShowEditor(!showEditor)}
          />{" "}
          Show JSON editor
        </label>
      </p>
      <p>
        <label>
          <input
            type="checkbox"
            checked={readOnly}
            onChange={() => setReadOnly(!readOnly)}
          />{" "}
          Read only
        </label>
      </p>

      {showEditor && (
        <>
          <h2>Editor</h2>
          <div className="my-editor">
            <VanillaJSONEditor
              content={content}
              readOnly={readOnly}
              onChange={setContent}
            />
            <button onClick={saveToLocalStorage}>Save JSON</button>
            <button onClick={retrieveFromLocalStorage}>Retrieve JSON</button>

          </div>
          <button onClick={saveJsonToFile}>Save Json</button>  
 

  {/* File input for uploading JSON */}
  <input
        type="file"
        accept=".json"
        onChange={handleFileChange}
        ref={fileInputRef}
        style={{ display: "none" }}
      />


      <button onClick={() => fileInputRef.current.click()}>Upload JSON</button>

        </>
      )}

      <>
        <h2>Contents</h2>
        <pre>
          <code>{JSON.stringify(content, null, 2)}</code>
        </pre>
      </>
    </div>
  );
}
