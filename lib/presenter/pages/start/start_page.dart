import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ratracks/domain/usecases/usecase.dart';
import 'package:ratracks/domain/usecases/user/create_anonymous_user_usecase.dart';
import 'package:ratracks/domain/usecases/user/get_logged_user_usecase.dart';
import 'package:ratracks/presenter/widgets/app_button.dart';

import '../../../domain/usecases/user/set_logged_user_usecase.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final CreateAnonymousUserUsecase createAnonymousUserUsecase =
      Modular.get<CreateAnonymousUserUsecase>();

  final GetLoggedUserUsecase getLoggedUserUsecase =
      Modular.get<GetLoggedUserUsecase>();

  final SetLoggedUserUsecase setLoggedUserUsecase =
      Modular.get<SetLoggedUserUsecase>();

  bool isLoading = false;

  void startAndRedirectToHome() async {
    var loggedUser = await getLoggedUserUsecase(NoParams());

    loggedUser.fold((left) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(left.message),
      ));
    }, (loggedUser) async {
      if (loggedUser != null) {
        Modular.to.navigate('/home/');

        return;
      }

      setState(() {
        isLoading = true;
      });

      var result = await createAnonymousUserUsecase(NoParams());

      result.fold((left) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(left.message),
        ));

        setState(() {
          isLoading = false;
        });
      }, (createdUser) async {
        var savedUser = await setLoggedUserUsecase(createdUser);

        savedUser.fold((left) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(left.message),
          ));

          setState(() {
            isLoading = false;
          });
        }, (savedUser) {
          setState(() {
            isLoading = false;
          });

          Modular.to.navigate('/home/');
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 132, 32),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: MediaQuery.of(context).size.width * 0.7,
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
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 15,
                                decoration: const BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(80, 15))),
                              ),
                            ))
                        .animate(onPlay: (controller) => controller.repeat())
                        .scaleX(
                            begin: 1.2,
                            end: 1,
                            curve: Curves.easeInOut,
                            duration: 2000.ms)
                        .then()
                        .scaleX(
                            begin: 1,
                            end: 1.2,
                            curve: Curves.easeInOut,
                            duration: 2000.ms),
                  ],
                )),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Text(
                  'Bem-vindo!\nAcompanhe suas\nentregas com facilidade :)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: AppButton.elevated(
                  text: 'Iniciar',
                  onPressed: startAndRedirectToHome,
                  isLoading: isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
