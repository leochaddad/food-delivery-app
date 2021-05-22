import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { OrdersController } from './orders/orders.controller';
import { OrdersService } from './orders/orders.service';
import { OrdersModule } from './orders/orders.module';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [
     AppService,
     TypeOrmModule.forRoot({
       type: 'sqlite',
       database: 'db', 
       entities:[__dirname+'/**/*.entity{.ts,.js}'],
       synchronize:true
     }),
     OrdersModule,

    ],
  controllers: [AppController, OrdersController],
  providers: [AppService, OrdersService],
})
export class AppModule {}
