import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:math';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromARGB(255, 255, 132, 32),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png', // replace with your image asset path
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.contain,
                    )
                        .animate(onPlay: (controller) => controller.repeat())
                        .moveY(
                            begin: -25,
                            end: 15,
                            curve: Curves.easeInOut,
                            duration: 2000.ms)
                        .then()
                        .moveY(
                            begin: 15,
                            end: -25,
                            curve: Curves.easeInOut,
                            duration: 2000.ms),
                    Padding(
                            padding: const EdgeInsets.only(top: 25, left: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: 15,
                                decoration: const BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.all(Radius.elliptical(150, 15))
                                ),
                              ),
                            ))
                        .animate(onPlay: (controller) => controller.repeat())
                        .scaleX(
                            begin: 1.2,
                            end: .9,
                            curve: Curves.easeInOut,
                            duration: 2000.ms)
                        .then()
                        .scaleX(
                            begin: .9,
                            end: 1.2,
                            curve: Curves.easeInOut,
                            duration: 2000.ms),
                  ],
                )),
              ),
              ElevatedButton(
                onPressed: () {
                  Modular.to.navigate('/home');
                },
                child: const Text('Iniciar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
