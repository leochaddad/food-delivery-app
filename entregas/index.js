const express = require('express');
const axios = require('axios');
const app = express();
app.use(express.json());
const { v4: uuidv4 } = require('uuid');


const funcoes = {

}
const entregas = [];

app.post('/pedidos/:id/entrega', async (req, res) => {
    const idEntrega = uuidv4();
    const entrega = {
        id : idEntrega,
        idPedido : req.params.id,
        localizacao: req.body.localizacao,
        motoboy:req.body.motoboy,
        status: "A Caminho"
    }
    entregas.push(entrega);

    const respos = await axios.post("http://localhost:10000/eventos", {
        tipo: "EntregaCriada",
        dados: entrega
    })
    console.log(respos)
    res.status(201).send(entrega)
})

app.get('/pedidos/:id/entrega', (req, res) => {
    res.send(entregas.find(entrega=> entrega.id === req.params.id))
})

app.listen(5000, async () => {
    console.log('Porta 5000. Entregas')
});

