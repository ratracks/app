import 'package:flutter_modular/flutter_modular.dart';
import 'package:ratracks/core/http/http_client_implementation.dart';
import 'package:ratracks/domain/usecases/user/create_anonymous_user_usecase.dart';
import 'package:ratracks/external/datasources/http_user_datasource.dart';
import 'package:ratracks/infra/repositories/user_repository_implementation.dart';
import 'package:ratracks/presenter/pages/start/start_page.dart';

class StartModule extends Module {
     @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CreateAnonymousUserUsecase(repository: i())),
    Bind.lazySingleton((i) => UserRepositoryImplementation(datasource: i())),
    Bind.lazySingleton((i) => HttpUserDatasource(httpClient: i())),
    Bind.lazySingleton((i) => HttpClientImplementation()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => StartPage()),
  ];
}
