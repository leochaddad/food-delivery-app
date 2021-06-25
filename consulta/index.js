const express = require('express')
const axios = require('axios')

const app = express()

app.use(express.json())

const funcoes = {
    "PedidoCriado": (pedido) =>{
        baseConsulta.push(pedido)
    },
    "PagamentoCriado":(pagamento) =>{
        const pedido = baseConsulta.find(pedido =>
             Number.parseInt(pedido.idPedido) === Number.parseInt(pagamento.pedidoId));
        console.log(pagamento)
        if(pedido){
            pedido.pagamento = pagamento;
        }
    }
}

const baseConsulta = []

app.get('/pedidos', (req, res) => {
    res.status(200).send(baseConsulta)
})

app.post('/eventos', (req, res) => {
    try {
        console.log(req.body.tipo)
        funcoes[req.body.tipo](req.body.dados)
    } catch (e) {}
    res.status(200).send(baseConsulta)
})

app.listen(7000, async () => {
    
    const resp = await axios.get('http://localhost:10000/eventos')
    resp.data.forEach((( valor, indice, colecao ) => {
        try {
            funcoes[valor.tipo](valor.dados)
        } catch (e) {}
    }))
    console.log('Microsserviço de Consulta iniciado na porta 7000.')
})