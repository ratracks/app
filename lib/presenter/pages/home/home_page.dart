import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  ListType selectedType = ListType.inProgress;

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
                    ButtonSegment(value: ListType.inProgress, label: Text('Em andamento')),
                    ButtonSegment(value: ListType.finished, label: Text('Finalizados')),
                  ],
                )),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 30)),
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
          }, childCount: 10)),
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
              Modular.to.pushNamed('/create_tracking');
            },
            text: 'Novo rastreio'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
