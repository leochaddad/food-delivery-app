const express = require('express')
const axios = require('axios')

const app = express()
app.use(express.json())

const eventos = []

app.post('/eventos', (req, res) => {
    const evento = req.body
    eventos.push(evento)
    // Envia o evento para o microsserviço de pedidos (3000)
    axios.post('http://localhost:3000/eventos', evento)
    // Envia o evento para o microsserviço de status (4000)
    axios.post('http://localhost:4000/eventos', evento)
    // Envia o evento para o microsserviço de entregas (5000)
    axios.post('http://localhost:5000/eventos', evento)
    // Envia o evento para o microsserviço de pagamentos (6000)
    axios.post('http://localhost:6000/eventos', evento)
    // Envia o evento para o microsserviço de consultas (7000)
    axios.post('http://localhost:7000/eventos', evento)

    res.status(200).send({ msg: 'OK' })
})

app.get('/eventos', (req, res) => {
    req.send(eventos)
})

app.listen(10_000, () => console.log('Microsserviço do Barramento de Eventos inicado na porta 10000.'))