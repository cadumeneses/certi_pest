import 'package:app/cliente_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cliente_presenter.dart';

class ClienteForm extends StatefulWidget {
  const ClienteForm({super.key});

  @override
  State<ClienteForm> createState() => _ClienteFormState();
}

class _ClienteFormState extends State<ClienteForm> {
  final _nome = TextEditingController();
  final _rua = TextEditingController();
  final _numero = TextEditingController();
  final _bairro = TextEditingController();
  final _cidade = TextEditingController();
  final _estado = TextEditingController();
  final _ambiente = TextEditingController();
  final _cnpj = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late ClientePresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = context.read<ClientePresenter>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do cliente';
                  }
                  return null;
                },
                controller: _nome,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Rua'),
                controller: _rua,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Número'),
                controller: _numero,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Bairro'),
                controller: _bairro,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Cidade'),
                controller: _cidade,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Estado'),
                controller: _estado,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Ambiente'),
                controller: _ambiente,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'CNPJ'),
                controller: _cnpj,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    presenter.submitForm(
                      _nome.text,
                      _rua.text,
                      _numero.text,
                      _bairro.text,
                      _cidade.text,
                      _estado.text,
                      _ambiente.text,
                      _cnpj.text,
                    );
                    _formKey.currentState!.reset();
                  }
                },
                child: const Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
