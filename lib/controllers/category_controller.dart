import 'package:conduit_core/conduit_core.dart';
import 'package:myproject/models/Category.dart';
import 'package:myproject/myproject.dart';

class CategoryController extends ResourceController{

  CategoryController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllCategories() async{
    final categoryQuery = Query<Category>(context);
    final categories = await categoryQuery.fetch();
    return Response.ok(categories);
  }

  @Operation.get('id')
  Future<Response> getCategoryByID(@Bind.path('id') int id) async{
    final categoryQuery = Query<Category>(context)
        ..where((c) => c.id).equalTo(id);

    final category = await categoryQuery.fetchOne();

    if(category == null){
      return Response.notFound();
    }

    return Response.ok(category);
  }

  @Operation.post()
  Future<Response> createCategory(@Bind.body() Category inputCategory) async{
    final categoryQuery = Query<Category>(context)..values = inputCategory;
    final insertedCategory = await categoryQuery.insert();
    return Response.ok(insertedCategory);
  }

  @Operation.put('id')
  Future<Response> updateCategory(@Bind.path('id') int id, @Bind.body() Category inputCategory) async{
    final categoryQuery = Query<Category>(context)
        ..where((c) => c.id).equalTo(id)
        ..values = inputCategory;

    final updatedCategory = await categoryQuery.updateOne();

    if(updatedCategory == null){
      return Response.notFound();
    }

    return Response.ok(updatedCategory);
  }

  @Operation.delete('id')
  Future<Response> deleteCategory(@Bind.path('id') int id) async {
    final categoryQuery = Query<Category>(context)
        ..where((c) => c.id).equalTo(id);

    final deletedCategory = await categoryQuery.delete();

    if(deletedCategory == 0){
      return Response.notFound();
    }

    return Response.ok(deletedCategory);
  }

}