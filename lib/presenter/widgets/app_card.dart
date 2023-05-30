import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppCard extends StatelessWidget {
  final DateTime updateAt;
  final String name;

  const AppCard({
    super.key,
    required this.updateAt,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final dateToString = DateFormat('dd/MM/yyyy - HH:mm').format(updateAt.toLocal());

    return SizedBox(
        width: double.infinity,
        height: 110,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Color.fromRGBO(62, 62, 62, 1),
                            fontSize: 14.0,
                          ),
                        ),
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
