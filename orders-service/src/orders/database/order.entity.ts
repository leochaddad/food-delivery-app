import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class OrderEntity {
  @PrimaryGeneratedColumn()
  idPedido: string;
  @Column()
  nome: string;
  @Column("integer")
  quantidade: number;
  @Column("integer")
  preco: number;
  @Column("integer")
  tamanho: number;
  @Column("integer")
  id: number;
  @Column('integer')
  controleTemperatura: number;
  @Column()
  created_at: number;

}
