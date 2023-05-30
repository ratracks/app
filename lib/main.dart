import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';

void main() {
  Animate.restartOnHotReload = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: const AppChild(),
    );
  }
}

class AppChild extends StatelessWidget {
  const AppChild({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RaTracks',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 255, 132, 32),
            titleTextStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            )),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(255.0, 60.0),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 255, 132, 32),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 255, 255, 255),
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            )),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(255.0, 60.0),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 255, 255, 255),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 255, 132, 32),
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            )),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                // set the desired border radius
              ),
            ),
          ),
        ),
        segmentedButtonTheme: SegmentedButtonThemeData(style: ButtonStyle(          
          side: MaterialStateProperty.resolveWith((states) {
            return const BorderSide(width: 1, color: Colors.orange);
          }),
          visualDensity: VisualDensity.comfortable,
          splashFactory: InkRipple.splashFactory,
          
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return const Color(0xFFFFB67B);
              }

              return Colors.transparent;
            },                      
          ),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const Color(0xFF3E3E3E);
            }

            return const Color(0xFF989898);
          }),
        )),
        primarySwatch: Colors.orange,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
