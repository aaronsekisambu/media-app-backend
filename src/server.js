import express from 'express';

const server = express();

const PORT = process.env.PORT || 3000;

server.listen(PORT, () => console.log(`Server running on ${PORT}`));
server.get('/', (req, res) => res.status(200).json({ message: 'hello' }));
