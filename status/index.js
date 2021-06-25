const express = require("express");
const axios = require("axios");
const app = express();
app.use(express.json());

const funcoes = {
    PagamentoCriado: (pagamento) => {
        pagamento.status = pagamento.status.includes("Aguardando") ? "Pago" : "Pago";
        axios.post("http//localhost:4000/eventos", {
            tipo: "PagamentoAtualizado",
            dados: pagamento
        })
    },
    EntregaCriada: (entrega) => {
        entrega.status = entrega.status.includes("A Caminho") ? "Entregue" : "Entregue";
        axios.post("http//localhost:4000/eventos", {
            tipo: "EntregaAtualizada",
            dados: entrega
        })
    },
}

app.post('/eventos', (req, res) => {
    try {
        funcoes[req.body.tipo](req.body.dados);
    } catch (err) { }
    res.status(200).send({ msg: "ok" });
})

app.listen(7000, () => {
    console.log('Status, Porta 4000')
});