import 'package:flutter/material.dart';

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
                child: Text('Produto de Teste'.replaceAll('', '\u200B'),
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 18,
                    ))),
            const Text('Código de rastreio',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.1,
          bottom: MediaQuery.of(context).size.height * 0.05,
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
        ),
        child: AppDetails(
          status: 'Rastreio cadastrado',
          zone: 'Vamos puxar as informações da entrega!',
          updateAt: DateTime.now(),
        ),
      )),
    );
  }
}
