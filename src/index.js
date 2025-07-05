const express = require("express")
const app = express();
const PORT = process.env.PORT || 8080;

var counter = 0;
app.get('/', (req, res) => {
    console.log("hi");
    // res.send(`
    //     <script>console.log(\`hi sent from server ${counter ++}\`) </script>
    //     `);
    res.json({ message: `From server. Counter: ${counter ++}`});
})
app.listen(PORT, () => {
    console.log(`Express app listening on http://localhost:${PORT}`);
});
