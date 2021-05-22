export class NewOrderDto{
    readonly products: string[];
    readonly comments: string;
    readonly address: string;
    readonly created_at: number;
    readonly status:string;

}