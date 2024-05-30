import 'package:conduit_core/conduit_core.dart';
import 'User.dart';
import 'Category.dart';

class Purchase extends ManagedObject<_Purchase> implements _Purchase {}

//Definición de la tabla Purchases
@Table(name: "Purchases")
class _Purchase {
  @primaryKey
  int? id;

  @Column()
  String? name;

  @Column()
  double? price;

  //Relación con Users con ONDELETE CASCADE
  @Relate(#purchases, onDelete: DeleteRule.cascade)
  User? user;

  //Relación con Categories con ONDELETE CASCADE
  @Relate(#purchases, onDelete: DeleteRule.cascade)
  Category? category;
}
