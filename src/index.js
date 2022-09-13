const express = require('express');
const app = express();
const cors = require('cors')
const path = require('path')
const fs = require('fs');
const PORT = 8001;

app.use(cors())
app.use('/static', express.static(path.join(__dirname, 'public')))
app.get('/list', (req, res) => {
	let list = []
	fs.readdir(path.join(__dirname, 'tileserver/tilesets'), (err, files) => {
		files.forEach(file => {
			if(file != '.DS_Store' && file != 'README.md'){
				list.push(file)
			}
		});
		res.send(list)
	});
});
app.get('/', (req, res) => {
	res.send('Hello World!');
});

app.listen(PORT, () => console.log(`Server listening on port: ${PORT}`));