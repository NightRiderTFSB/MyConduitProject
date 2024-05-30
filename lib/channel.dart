import 'package:conduit/conduit.dart';
import 'package:myproject/controllers/category_controller.dart';
import 'package:myproject/controllers/purchase_controller.dart';
import 'package:myproject/controllers/user_controller.dart';
import 'package:myproject/models/User.dart';
import 'package:conduit_postgresql/conduit_postgresql.dart';
import 'myproject.dart';

class MyprojectChannel extends ApplicationChannel {
  ManagedContext? context;

  @override
  Future<void> prepare() async {
    final config = MyprojectConfiguration(options!.configurationFilePath!);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final pgOptions = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName,
    );

    context = ManagedContext(dataModel, pgOptions);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router
        .route('/users/[:id]')
        .link(() => UserController(context!));

    router
        .route('/categories/[:id]')
        .link(() => CategoryController(context!));

    router
        .route('/purchases/[:id]')
        .link(() => PurchaseController(context!));

    return router;
  }
}

class MyprojectConfiguration extends Configuration {
  MyprojectConfiguration(String path) : super.fromFile(File(path));

  DatabaseConfiguration database = DatabaseConfiguration();
}
