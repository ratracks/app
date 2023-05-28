import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ratracks/domain/entities/enums/transporter_enum.dart';
import 'package:ratracks/domain/repositories/tracking_repository.dart';
import 'package:ratracks/domain/usecases/tracking/create_tracking_usecase.dart';
import 'package:ratracks/domain/usecases/usecase.dart';
import 'package:ratracks/domain/usecases/user/get_logged_user_usecase.dart';
import 'package:ratracks/presenter/widgets/app_button.dart';

class CreateTrackingPage extends StatefulWidget {
  const CreateTrackingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return CreateTrackingPageState();
  }
}

class CreateTrackingPageState extends State<CreateTrackingPage> {
  final CreateTrackingUsecase createTrackingUsecase =
      Modular.get<CreateTrackingUsecase>();

  final GetLoggedUserUsecase getLoggedUserUsecase =
      Modular.get<GetLoggedUserUsecase>();

  final _formKey = GlobalKey<FormState>();

  String trackingCode = '';
  String? trackingName;
  bool isLoading = false;

  void createTracking() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var userEither = await getLoggedUserUsecase(NoParams());

      if (userEither.isLeft()) {
        return;
      }

      var user = userEither.getOrElse(() => null);

      setState(() {
        isLoading = true;
      });

      var result = await createTrackingUsecase(CreateTrackingParams(
          trackingCode: trackingCode,
          productName: trackingName,
          userId: user!.id,
          transporter: Transporter.correios));

      result.fold((l) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l.message)),
        );

        setState(() {
          isLoading = false;
        });
      }, (r) {
        setState(() {
          isLoading = false;
        });
        
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Sucesso!'),
                content:
                    Text('O rastreio $trackingCode foi cadastrado com êxito.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Voltar'),
                    onPressed: () {
                      Navigator.pop(context);
                      Modular.to.pop();
                    },
                  ),
                ],
              );
            });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Novo rastreio'),
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
                bottom: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Form(
                  key: _formKey,
                  child: Column(children: [
                    DropdownButton(
                        isExpanded: true,
                        value: 'correios',
                        items: const [
                          DropdownMenuItem(
                            value: 'correios',
                            child: Text('Correios'),
                          )
                        ],
                        onChanged: null),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (String? value) {
                        trackingCode = value ?? '';
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Adicione um código de rastreio';
                        }
                        if (value.isEmpty) {
                          return 'Adicione um código de rastreio';
                        }

                        RegExp regex = RegExp(
                            r"^(?:[A-Z]{2}\d{9}[A-Z]{2}|\d{3}\.\d{3}\.\d{3}-\d{2})$");

                        if (!regex.hasMatch(value)) {
                          return 'Código de rastreio inválido';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Código de rastreio *',
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (String? value) {
                        trackingName = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Nome do produto',
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: double.infinity,
                        child: AppButton.filled(
                          onPressed: createTracking,
                          text: 'Cadastrar',
                          isLoading: isLoading,
                        ),
                      ),
                    ))
                  ]))),
        ));
  }
}
