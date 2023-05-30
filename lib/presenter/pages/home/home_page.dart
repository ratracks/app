import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ratracks/domain/entities/enums/status_enum.dart';
import 'package:ratracks/domain/entities/tracking_entity.dart';
import 'package:ratracks/domain/repositories/tracking_repository.dart';
import 'package:ratracks/domain/usecases/tracking/get_trackings_usecase.dart';
import 'package:ratracks/domain/usecases/usecase.dart';
import 'package:ratracks/domain/usecases/user/get_logged_user_usecase.dart';
import 'package:ratracks/presenter/widgets/app_button.dart';

enum ListType {
  inProgress,
  finished,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetTrackingsUsecase getTrackingsUsecase =
      Modular.get<GetTrackingsUsecase>();

  final GetLoggedUserUsecase getLoggedUserUsecase =
      Modular.get<GetLoggedUserUsecase>();

  ListType selectedType = ListType.inProgress;
  bool isLoadingTrackings = false;
  List<TrackingEntity> trackings = [];

  @override
  void initState() {
    super.initState();
    initPage();
  }

  void initPage() async {
    var result = await getLoggedUserUsecase(NoParams());

    if (result.isLeft()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showSnackbar(context);
      });

      return;
    }

    var user = result.getOrElse(() => null);

    setState(() {
      isLoadingTrackings = true;
    });

    var trackingsResult = await getTrackingsUsecase(
        GetTrackingsParams(status: Status.inProgress, userId: user!.id));

    trackingsResult.fold((l) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showSnackbar(context, message: l.message);
      });

      setState(() {
        isLoadingTrackings = false;
      });

      return;
    }, (r) {
      setState(() {
        trackings = r;
        isLoadingTrackings = false;
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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            title: Text(
              'Ratracks',
              style: TextStyle(fontSize: 20),
            ),
            floating: true,
            snap: true,
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 30)),
          SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: SegmentedButton(
                  selected: {selectedType},
                  onSelectionChanged: (value) {
                    setState(() {
                      selectedType = value.first;
                    });
                  },
                  segments: const [
                    ButtonSegment(
                        value: ListType.inProgress,
                        label: Text('Em andamento')),
                    ButtonSegment(
                        value: ListType.finished, label: Text('Finalizados')),
                  ],
                )),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 30)),
          if (isLoadingTrackings)
            const SliverToBoxAdapter(
              child: Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          if (!isLoadingTrackings && trackings.isEmpty)
            const SliverToBoxAdapter(
              child: Center(
                child: Text('Nenhum rastreio encontrado =/'),
              ),
            ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, _) {
            return Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
              ),
              child: GestureDetector(
                onTap: () {
                  Modular.to.pushNamed('tracking_details/teste');
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Container(
                    color: Colors.black38,
                    child: const Center(child: Text('Rastreio')),
                  ),
                ),
              ),
            );
          }, childCount: trackings.length)),
          SliverPadding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03 + 100.0)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.03,
        ),
        child: AppButton.filled(
            onPressed: () {
              Modular.to.pushNamed('/create_tracking/');
            },
            text: 'Novo rastreio'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
