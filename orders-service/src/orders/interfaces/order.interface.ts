export interface Order{
    order_id?:string;
    user_id?:string;
    comments?:string;
    address:string;
    products:string[];
    created_at:number;
    status:string;
}