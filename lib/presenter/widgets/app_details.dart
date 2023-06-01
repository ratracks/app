import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDetails extends StatelessWidget {
  final DateTime updateAt;
  final String status;
  final String zone;

  const AppDetails({
    super.key,
    required this.updateAt,
    required this.status,
    required this.zone,
  });

  @override
  Widget build(BuildContext context) {
    final dateToString = DateFormat('dd/MM/yyyy - HH:mm').format(updateAt);

    return SizedBox(
        width: double.infinity,
        height: 130,
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              status,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color.fromRGBO(255, 132, 32, 1),
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              zone,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color.fromRGBO(62, 62, 62, 1),
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          dateToString,
                          style: const TextStyle(
                            color: Color.fromRGBO(112, 112, 112, 1),
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  ]),
            )));
  }
}
