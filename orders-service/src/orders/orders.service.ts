import { Injectable } from '@nestjs/common';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { Order } from './interfaces/order.interface';
import { OrderEntity } from './database/order.entity';

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
    return await this.orderRepository.save(order);
  }
  async cancellOrder(id: string): Promise<any>{
      //muda o status para cancelado
      //emite evento de status cancelado
  }
}
