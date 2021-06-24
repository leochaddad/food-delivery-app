export interface Order{
    id:number;
    nome:string;
    quantidade:number;
    preco:number;
    tamanho:number;
    controleTemperatura:number;
    idPedido?:string;
    created_at?:number;

}