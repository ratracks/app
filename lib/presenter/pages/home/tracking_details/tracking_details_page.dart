import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ratracks/domain/entities/tracking_entity.dart';
import 'package:ratracks/domain/repositories/tracking_repository.dart';
import '../../../../domain/usecases/tracking/get_tracking_details_usecase.dart';
import '../../../widgets/app_details.dart';

class TrackingDetailsPage extends StatefulWidget {
  final String trackingId;

  const TrackingDetailsPage({super.key, required this.trackingId});

  @override
  State<StatefulWidget> createState() {
    return _TrackingDetailsPageState();
  }
}

class _TrackingDetailsPageState extends State<TrackingDetailsPage> {
  final GetTrackingDetailsUseCase getTrackingDetailsUseCase =
      Modular.get<GetTrackingDetailsUseCase>();

  bool isLoadingTrackingDetails = false;
  TrackingEntity? tracking;

  @override
  void initState() {
    super.initState();

    load();
  }

  Future<void> load({bool showLoading = true}) async {
    if (showLoading) {
      setState(() {
        isLoadingTrackingDetails = true;
      });
    }

    var result = await getTrackingDetailsUseCase(
        GetTrackingDetailsParams(trackingId: widget.trackingId));

    result.fold((l) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showSnackbar(context, message: l.message);
      });

      setState(() {
        isLoadingTrackingDetails = false;
      });

      return;
    }, (r) {
      setState(() {
        tracking = r;
        isLoadingTrackingDetails = false;
      });
    });
  }

  void _showSnackbar(BuildContext ctx,
      {String message = 'Ocorreu um erro inesperado.'}) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text('Oops... $message'),
        duration: const Duration(
          seconds: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                    isLoadingTrackingDetails
                        ? 'Carregando...'
                        : tracking != null
                            ? tracking!.productName!.replaceAll('', '\u200B')
                            : 'Opsss...',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 18,
                    ))),
            if (tracking != null &&
                (tracking!.trackingCode != tracking!.productName))
              Text(tracking!.trackingCode,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal)),
          ],
        ),
      ),
      body: SafeArea(
          child: isLoadingTrackingDetails
              ? const Center(child: CircularProgressIndicator())
              : tracking != null
                  ? buildList()
                  : const Center(
                      child: Text(
                      'Não foi possível carregar as informações. Tente novamente mais tarde!',
                      textAlign: TextAlign.center,
                    ))),
    );
  }

  Widget buildList() {
    return RefreshIndicator(
      onRefresh: () async {
        await load(showLoading: false);
      },
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.height * 0.05,
          bottom: MediaQuery.of(context).size.height * 0.05,
        ),
        itemBuilder: (context, index) {
          var item = tracking!.trackingDetails!.events[index];

          return AppDetails(
            updateAt: item.eventDate,
            status: item.description,
            zone:
                '${item.type} - ${item.city} ${item.uf.isNotEmpty ? '- ${item.uf}' : ''}',
          );
        },
        itemCount: tracking!.trackingDetails!.events.length,
      ),
    );
  }
}
