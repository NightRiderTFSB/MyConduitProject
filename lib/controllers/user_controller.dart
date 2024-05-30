import 'package:conduit_core/conduit_core.dart';
import 'package:myproject/models/User.dart';

class UserController extends ResourceController{

  UserController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllUsers() async {
    final userQuery = Query<User>(context);
    final users = await userQuery.fetch();
    return Response.ok(users);
  }

  @Operation.get('id')
  Future<Response> getUserByID(@Bind.path('id') int id) async{
    final userQuery = Query<User>(context)
        ..where((u) => u.id).equalTo(id);

    final user = await userQuery.fetchOne();

    if(user == null){
      return Response.notFound();
    }

    return Response.ok(user);
  }

  @Operation.post()
  Future<Response> createUser(@Bind.body() User inputUser) async {
    final userQuery = Query<User>(context)..values = inputUser;
    final insertedUser = await userQuery.insert();

    return Response.ok(insertedUser);
  }

  @Operation.post('login')
  Future<Response> loginUser(@Bind.body() Map<String, dynamic> loginData) async {
    final username = loginData['username'] as String?;
    final password = loginData['password'] as String?;

    if (username == null || password == null) {
      return Response.badRequest(body: {'error': 'Missing username or password'});
    }

    final userQuery = Query<User>(context)
      ..where((u) => u.username).equalTo(username)
      ..where((u) => u.password).equalTo(password);

    final user = await userQuery.fetchOne();

    if (user == null) {
      return Response.unauthorized(body: {'error': 'Invalid username or password'});
    }

    return Response.ok({'message': 'Login successful', 'user': user});
  }

  @Operation.put('id')
  Future<Response> updateUser(@Bind.path('id') int id, @Bind.body() User inputUser) async {
    final userQuery = Query<User>(context)
      ..where((u) => u.id).equalTo(id)
      ..values = inputUser;

    final updatedUser = await userQuery.updateOne();

    if (updatedUser == null) {
      return Response.notFound();
    }

    return Response.ok(updatedUser);
  }

  @Operation.delete('id')
  Future<Response> deleteUser(@Bind.path('id') int id) async {
    final userQuery = Query<User>(context)
      ..where((u) => u.id).equalTo(id);
    final deletedUser = await userQuery.delete();

    if (deletedUser == 0) {
      return Response.notFound();
    }

    return Response.ok(deletedUser);
  }

}