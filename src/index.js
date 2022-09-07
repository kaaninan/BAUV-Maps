const express = require('express');
const app = express();
const cors = require('cors')
const PORT = 8001;

app.use(cors({origin: 'http://localhost:8081'}));

app.use(express.static('public'));
// app.use(cors())
app.get('/', (req, res) => {
    res.send('Hello World!');
});

app.listen(PORT, () => console.log(`Server listening on port: ${PORT}`));
