// Get references to HTML elements
const jsonInput = document.getElementById('jsonInput');
const jsonOutput = document.getElementById('jsonOutput');
const parseButton = document.getElementById('parseButton');

// Attach an event listener to the Parse JSON button
parseButton.addEventListener('click', () => {
    try {
        const inputText = jsonInput.value;
        const parsedData = JSON.parse(inputText);
        // Display the parsed JSON data in the output area
        jsonOutput.value = JSON.stringify(parsedData, null, 2);
    } catch (error) {
        jsonOutput.value = 'Invalid JSON: ' + error.message;
    }
});
