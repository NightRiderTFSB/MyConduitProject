import 'package:conduit_core/conduit_core.dart';
import 'Purchase.dart';

class Category extends ManagedObject<_Category> implements _Category {}

//Definiciṕon de la tabla Categories
@Table(name: "Categories")
class _Category {
  @primaryKey
  int? id;

  @Column(unique: true)
  String? category;

  @Column()
  String? description;

  //Relación con Purchases
  ManagedSet<Purchase>? purchases;
}
