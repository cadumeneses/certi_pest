import 'package:app/cliente_repository.dart';
import 'package:app/show_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cliente_presenter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ClientePresenter>().loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CertiPest'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              showModal(context);
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          showModal(context);
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.9,
              width: size.width,
              child: ListView.builder(
                itemCount: context.watch<ClientePresenter>().clientes.length,
                itemBuilder: (context, index) {
                  final cliente =
                      context.watch<ClientePresenter>().clientes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/details', arguments: cliente);
                    },
                    child: ListTile(
                      title: Text(
                        cliente.nome.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        cliente.cnpj,
                      ),
                      trailing: Text(cliente.cidade.toUpperCase()),
                    ),
                  );
                },
              ),
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
        return const ClienteForm();
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
