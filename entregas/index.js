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

    await axios.post("http://localhost:10000/eventos", {
        tipo: "EntregaCriada",
        dados: entrega
    })

    res.status(200).send(entrega)
})

app.put('/pedidos/:id/entrega', async (req, res) => {
    const entrega = entregas.find(entrega=>entrega.idPedido === req.params.id)
    if(req.body.status){
        entrega.status = req.body.status
    }
    await axios.post("http://localhost:10000/eventos", {
        tipo: "EntregaAlterada",
        dados: entrega
    })

    res.status(200).send(entrega)
})

app.get('/pedidos/:id/entrega', (req, res) => {
    res.send(entregas.find(entrega=> entrega.id === req.params.id))
})

app.listen(5000, async () => {
    console.log('Porta 5000. Entregas')
});

