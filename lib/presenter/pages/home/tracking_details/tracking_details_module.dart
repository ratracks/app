import 'package:flutter_modular/flutter_modular.dart';
import 'package:ratracks/core/http/http_client_implementation.dart';
import 'package:ratracks/domain/usecases/tracking/get_tracking_details_usecase.dart';
import 'package:ratracks/external/datasources/http_tracking_datasource.dart';
import 'package:ratracks/infra/repositories/tracking_repository_implementation.dart';
import 'package:ratracks/presenter/pages/home/tracking_details/tracking_details_page.dart';

class TrackingDetailsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => GetTrackingDetailsUseCase(repository: i())),
    Bind.lazySingleton(
        (i) => TrackingRepositoryImplementation(datasource: i())),
    Bind.lazySingleton((i) => HttpTrackingDatasource(httpClient: i())),
    Bind.lazySingleton((i) => HttpClientImplementation()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:trackingId',
        child: (_, args) =>
            TrackingDetailsPage(trackingId: args.params['trackingId'])),
  ];
}
