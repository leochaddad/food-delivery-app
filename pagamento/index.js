const express = require('express')
const axios = require('axios')
const { v4: uuidv4 } = require('uuid')

const app = express()
app.use(express.json())

const funcoes = {
    pagamentoCriado: (pagamento) => {
        const pagamentos = pagamentoPorPedidoId[pagamento.pedidoId]
        const pagamentoParaAtualizar = pagamentos.find((p) => p.id === pagamento.id)
        pagamentoParaAtualizar.status = pagamento.status

        axios.post('http://localhost:10000/eventos', {
            tipo: "PagamentoAtualizado",
            dados: {
                id: pagamento.id,
                pedidoId: pagamento.pedidoId,
                status: pagamento.status
            }
        })
    }
}

const pagamentoPorPedidoId = {}

app.put('/pedidos/:id/pagamento', async (req, res) => {
    const idPag = uuidv4()
    const pagamentoDoPedido = pagamentoPorPedidoId[req.params.id] || []
    pagamentoDoPedido.push({ id: idPag, status: 'Aguardando' })
    pagamentoPorPedidoId[req.params.id] = pagamentoDoPedido
    await axios.post('http://localhost:10000/eventos', {
        tipo: "PagamentoCriado",
        dados: {
            id: idPag,
            pedidoId: req.params.id,
            status: "Aguardando"
        }
    })
    res.status(201).send(pagamentoDoPedido)
})

app.get('/pedidos/:id/pagamento', (req, res) => {
    res.send(pagamentoPorPedidoId[req.params.id] || [])
})

app.post('/eventos', (req, res) => {
    try {
        funcoes[req.body.tipo](req.body.dados)
    } catch (e) {}
    res.status(200).send({ msg: 'OK' })
})

app.listen(6000, () => console.log("Microsserviço de Pagamentos iniciado na porta 6000."))