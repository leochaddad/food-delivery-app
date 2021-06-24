export class NewOrderDto{
    readonly id: number;
    readonly nome: string;
    readonly tamanho: number;
    readonly preco:number;
    readonly controleTemperatura: number;
    readonly quantidade: number;
    readonly idPedido?:string;
    readonly created_at: number;
}