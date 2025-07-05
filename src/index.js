const express = require("express")
const app = express();
const PORT = process.env.PORT || 8080;

var counter = 0;
app.get('/', (req, res) => {
    console.log("hi");
    // res.send(`
    //     <script>console.log(\`hi sent from server, take this and maja ${counter ++}\`) </script>
    //     `);
    res.json({ message: `Docker is easy lol ${counter ++}`});
})
app.listen(PORT, () => {
    console.log(`Express app listening on http://localhost:${PORT}`);
});