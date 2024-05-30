import 'package:conduit_core/conduit_core.dart';
import 'package:myproject/models/Purchase.dart';

class PurchaseController extends ResourceController {
  PurchaseController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllPurchases() async {
    try {
      final purchaseQuery = Query<Purchase>(context);
      final purchases = await purchaseQuery.fetch();
      return Response.ok(purchases);
    } catch (e) {
      return Response.serverError(body: {'error': e.toString()});
    }
  }

  @Operation.get('id')
  Future<Response> getPurchaseByID(@Bind.path('id') int id) async {
    try {
      final purchaseQuery = Query<Purchase>(context)
        ..where((p) => p.id).equalTo(id);
      final purchase = await purchaseQuery.fetchOne();

      if (purchase == null) {
        return Response.notFound();
      }

      return Response.ok(purchase);
    } catch (e) {
      return Response.serverError(body: {'error': e.toString()});
    }
  }

  @Operation.post()
  Future<Response> createPurchase(@Bind.body() Purchase inputPurchase) async {
    try {
      final purchaseQuery = Query<Purchase>(context)..values = inputPurchase;
      final insertedPurchase = await purchaseQuery.insert();

      return Response.ok(insertedPurchase);
    } catch (e) {
      return Response.serverError(body: {'error': e.toString()});
    }
  }

  @Operation.put('id')
  Future<Response> updatePurchase(
      @Bind.path('id') int id, @Bind.body() Purchase inputPurchase) async {
    try {
      final purchaseQuery = Query<Purchase>(context)
        ..where((p) => p.id).equalTo(id)
        ..values = inputPurchase;

      final updatedPurchase = await purchaseQuery.updateOne();

      if (updatedPurchase == null) {
        return Response.notFound();
      }

      return Response.ok(updatedPurchase);
    } catch (e) {
      return Response.serverError(body: {'error': e.toString()});
    }
  }

  @Operation.delete('id')
  Future<Response> deletePurchase(@Bind.path('id') int id) async {
    try {
      final purchaseQuery = Query<Purchase>(context)
        ..where((p) => p.id).equalTo(id);
      final deletedPurchase = await purchaseQuery.delete();

      if (deletedPurchase == 0) {
        return Response.notFound();
      }

      return Response.ok(deletedPurchase);
    } catch (e) {
      return Response.serverError(body: {'error': e.toString()});
    }
  }
}
