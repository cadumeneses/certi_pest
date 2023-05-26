import 'package:app/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:app/cliente_model.dart';

class ClienteDetails extends StatefulWidget {
  const ClienteDetails({Key? key}) : super(key: key);

  @override
  State<ClienteDetails> createState() => _ClienteDetailsState();
}

class _ClienteDetailsState extends State<ClienteDetails> {
  late ClienteModel cliente;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cliente = ModalRoute.of(context)?.settings.arguments as ClienteModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Cliente'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModal(context);
        },
        child: const Icon(Icons.document_scanner),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ${cliente.nome}'.toUpperCase(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Endereço:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Rua: ${cliente.rua}'.toUpperCase()),
            Text('Número: ${cliente.numero}'.toUpperCase()),
            Text('Bairro: ${cliente.bairro}'.toUpperCase()),
            Text('Cidade: ${cliente.cidade}'.toUpperCase()),
            Text('Estado: ${cliente.estado}'.toUpperCase()),
            const SizedBox(height: 8),
            Text(
              'Ambiente: ${cliente.ambiente}'.toUpperCase(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'CNPJ: ${cliente.cnpj}'.toUpperCase(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.background,
      builder: (_) {
        return CustomForm(
          cliente: cliente,
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}
