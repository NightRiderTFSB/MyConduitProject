import 'package:conduit_core/conduit_core.dart';
import 'Purchase.dart';

class User extends ManagedObject<_User> implements _User {}

//Definición de la tabla Users con sus atributos y relaciones
@Table(name: "Users")
class _User {
  @primaryKey
  int? id;

  @Column(unique: true)
  String? username;

  @Column(unique: true)
  String? email;

  @Column()
  String? password;

  //Relación con tabla Purchases
  ManagedSet<Purchase>? purchases;
}
