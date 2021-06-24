export interface Order{
    idProduto:number;
    nomeProduto:string;
    quantidade:number;
    controleTemperatura:number;
    idPedido?:string;
    created_at?:number;

}