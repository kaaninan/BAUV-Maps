const express = require('express');
const app = express();
const cors = require('cors')
const path = require('path')
const PORT = 8001;

// app.use(cors({origin: 'http://localhost:8001'}));
// app.use(cors())

app.use('/static', express.static(path.join(__dirname, 'public')))
app.get('/', (req, res) => {
	res.send('Hello World!');
});

app.listen(PORT, () => console.log(`Server listening on port: ${PORT}`));