import 'package:flutter/material.dart';

class CreateTrackingPage extends StatelessWidget {
  const CreateTrackingPage({super.key});

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
        child: Column(
        children: [
          DropdownButton(
            isExpanded: true,
            value: 'correios',
            items: const [
              DropdownMenuItem(
                value: 'correios',
                child: Text('Correios'),
              )
            ], 
            onChanged: null
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Código de rastreio *',
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Nome do produto',
            ),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                onPressed: null,
                child: Text('Cadastrar'),
              ),
              ),
            )
          )
        ]
      )
      ),
      )
    );
  }
}
