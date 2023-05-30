import 'package:flutter_modular/flutter_modular.dart';
import 'package:ratracks/core/http/http_client_implementation.dart';
import 'package:ratracks/core/storage/storage_implementation.dart';
import 'package:ratracks/domain/usecases/tracking/get_trackings_usecase.dart';
import 'package:ratracks/domain/usecases/user/get_logged_user_usecase.dart';
import 'package:ratracks/external/datasources/http_tracking_datasource.dart';
import 'package:ratracks/external/datasources/http_user_datasource.dart';
import 'package:ratracks/infra/repositories/tracking_repository_implementation.dart';
import 'package:ratracks/infra/repositories/user_repository_implementation.dart';
import 'package:ratracks/presenter/pages/home/home_page.dart';
import 'package:ratracks/presenter/pages/home/tracking_details/tracking_details_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => GetTrackingsUsecase(repository: i())),
    Bind.lazySingleton((i) => GetLoggedUserUsecase(repository: i())),
    Bind.lazySingleton(
        (i) => TrackingRepositoryImplementation(datasource: i())),
    Bind.lazySingleton(
        (i) => UserRepositoryImplementation(datasource: i(), userStorage: i())),
    Bind.lazySingleton((i) => HttpUserDatasource(httpClient: i())),
    Bind.lazySingleton((i) => HttpTrackingDatasource(httpClient: i())),
    Bind.lazySingleton((i) => HttpClientImplementation()),
    Bind.lazySingleton((i) => StorageImplementation()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute('/tracking_details/:trackingId',
        child: (_, args) =>
            TrackingDetailsPage(trackingId: args.params['trackingId'])),
  ];
}
