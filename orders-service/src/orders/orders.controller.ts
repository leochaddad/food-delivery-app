import { Controller, Get, Post, Param, Body, Delete} from '@nestjs/common';
import { NewOrderDto } from './dto/new-order.dto';
import { OrdersService } from './orders.service';
import { Order } from './interfaces/order.interface';


@Controller('orders')
export class OrdersController {
    constructor(private readonly ordersService: OrdersService){}
    
    @Get()
    async findAll():Promise<Order[]> {
        return this.ordersService.findAll();
    }

    @Get(':id')
    async findOne(@Param() params):Promise<Order> {
        return this.ordersService.findOne(params.id);
    }

    @Post()
    async newOrder(@Body() newOrder: NewOrderDto):Promise<Order> {
        return this.ordersService.createOrder(newOrder);
    }
    @Delete(':id')
    async cancellOrder(@Param() params){
        return this.ordersService.cancellOrder(params.id);
    }

}
