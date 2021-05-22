import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class OrderEntity {
  @PrimaryGeneratedColumn()
  order_id?: string;
  @Column()
  user_id?: string;
  @Column()
  comments?: string;
  @Column()
  address: string;
  @Column('text')
  products: string[];
  @Column()
  created_at: number;
  @Column()
  status:string;

}
