import { Injectable } from '@nestjs/common';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { Order } from './interfaces/order.interface';
import { OrderEntity } from './database/order.entity';
import axios from 'axios';

@Injectable()
export class OrdersService {
  constructor(
    @InjectRepository(OrderEntity)
    private orderRepository: Repository<OrderEntity>
  ) {}

  async findAll(): Promise<Order[]>  {
    return await this.orderRepository.find();
  }

  async findOne(id: string): Promise<Order> {
    return await this.orderRepository.findOne(id);
  }

  async createOrder(order :Order):Promise<Order> {
    order.created_at=new Date().getTime();
    const createdOrder =  await this.orderRepository.save(order);

    await axios.post("http://localhost:10000/eventos", {
      tipo:"PedidoCriado", 
      dados:createdOrder
    })
    return createdOrder;
  }
  async cancellOrder(id: string): Promise<any>{
    await axios.post("http://localhost:10000/eventos", {
      tipo:"PedidoCancelado", 
      dados:{idPedido: id}
    })
      //muda o status para cancelado
      //emite evento de status cancelado
  }
}
