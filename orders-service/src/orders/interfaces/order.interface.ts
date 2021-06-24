export interface Order{
    idProduto:string;
    nomeProduto:string;
    quantidade:number;
    controleTemperatura:number;
    idPedido?:string;
    created_at?:number;

}