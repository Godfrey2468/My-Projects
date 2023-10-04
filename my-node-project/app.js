// Import required modules
const express = require('express');

// Create an instance of the Express application
const app = express();

// Middleware to serve static files (e.g., CSS and images)
app.use(express.static('public'));

// Parse JSON and URL-encoded body data
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve the login page at the root URL
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

// Handle login POST requests
app.post('/login', (req, res) => {
    const { username, password } = req.body;
    
    // Implement your authentication logic here
    // For demonstration purposes, we'll assume any non-empty username and password combination is valid
    if (username && password) {
        // Redirect to the "Hello, World!" page
        res.redirect('/greet/' + username);
    } else {
        // Handle invalid login credentials (e.g., show an error message)
        res.send('<h1>Invalid login credentials</h1>');
    }
});

// Define a route that responds with an HTML page with a greeting message
app.get('/greet/:name', (req, res) => {
    const name = req.params.name || 'Guest';
    res.send(`
        <html>
        <head>
            <title>Greeting Page</title>
            <link rel="stylesheet" href="/styles.css">
        </head>
        <body>
            <h1>Hello, ${name}!</h1>
            <a href="/">Back to Login</a>
        </body>
        </html>
    `);
});

// Set the server to listen on a specific port (e.g., 3000)
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
