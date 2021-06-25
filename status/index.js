const express = require("express");
const axios = require("axios");
const app = express();
app.use(express.json());

const funcoes = {
    PedidoCriado: (pedido) => {
        axios.post("http://localhost:10000/eventos", {
            tipo: "StatusAlterado",
            dados: {
                idPedido: pedido.idPedido,
                status:"Aguardando pagamento"
            }
        })
    },
    PagamentoCriado: (pagamento) => {
        axios.post("http://localhost:10000/eventos", {
            tipo: "StatusAlterado",
            dados: {
                idPedido: pagamento.pedidoId,
                status:"Aguardando entrega"
            }
        })
    },
    EntregaCriada: (entrega) => {
        axios.post("http://localhost:10000/eventos", {
            tipo: "StatusAlterado",
            dados: {
                idPedido: entrega.idPedido,
                status:"Em entrega"
            }
        })
    },
    EntregaAlterada: (entrega) => {
        if(entrega.status.includes("entregue")){
        axios.post("http://localhost:10000/eventos", {
            tipo: "StatusAlterado",
            dados: {
                idPedido: entrega.idPedido,
                status:"Entregue"
            }
        })
    }
    },
    PedidoCancelado:({idPedido}) => {
        axios.post("http://localhost:10000/eventos", {
            tipo: "StatusAlterado",
            dados: {
                idPedido: idPedido,
                status:"Cancelado"
            }
        })
    }

}

app.post('/eventos', (req, res) => {
    console.log(req.body)
    try {
        funcoes[req.body.tipo](req.body.dados);
    } catch (err) { }
    res.status(200).send({ msg: "ok" });
})

app.listen(4000, () => {
    console.log('Status, Porta 4000')
});