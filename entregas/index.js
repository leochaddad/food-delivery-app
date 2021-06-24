const express = require('express');
const axios = require('axios');
const app = express();
app.use(express.json());
const { v4: uuidv4 } = require('uuid');

const funcoes = {
    entregaCriada: (entrega) => {
        const entregas = entregaPorPedidoId[entrega.pedidoId];
        const entregaParaAtualizar = entregas.find((e) => e.id === entrega.id)
        entregaParaAtualizar.status = entrega.status;
        axios.post('http://localhost:5000/eventos', {
            tipo: "entregaAtualizada",
            dados: {
                id: entrega.Id,
                pedididoId: entrega.pedididoId,
                status: entrega.status,
                localizacao: entrega.localizacao,
                motoboy: entrega.motoboy
            }
        })
    }
}

app.put('/pedidos/:id/entrega', (req, res) => {
    const idEntrega = uuidv4();
    const { texto } = req.body;
    const entregaDoPedido = entregaPorPedidoId[req.params.id] || [];
    entregaDoPedido.push({ id: idEntrega, localizacao, motoboy, status: 'A Caminho' })
    entregaPorPedidoId[req.params.id] = entregaDoPedido
    await axios.post("localhost:5000/eventos", {
        tipo: entregaCriada,
        dados: {
            id = idEntrega,
            idPedido = req.params.id,
            localizacao,
            motoboy,
            status: "A Caminho"
        }
    })
    res.status(201).send(entregaDoPedido)
})

app.get('/pedidos/:id/entrega', (req, res) => {
    res.send(entregaPorPedidoId[req.params.id] || [])
})

app.listen(5000, async () => {
    console.log('Porta 5000. Entregas')
});

app.post('/pedidos/:id/entrega', (req, res) => {
    try {
        funcoes[req.body.tipo](req.body.dados)
    } catch (e) { }
    res.status(200).send({ msg: 'OK' })
})