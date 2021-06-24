import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class OrderEntity {
  @PrimaryGeneratedColumn()
  idPedido: string;
  @Column()
  nomeProduto: string;
  @Column("integer")
  quantidade: number;
  @Column("integer")
  idProduto: number;
  @Column('integer')
  controleTemperatura: number;
  @Column()
  created_at: number;


}
