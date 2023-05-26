import 'package:app/certificado.dart';
import 'package:app/cliente_details.dart';
import 'package:app/cliente_model.dart';
import 'package:app/cliente_repository.dart';
import 'package:app/generate_pdf.dart';
import 'package:app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'cliente_presenter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClientePresenter>(
          create: (context) => ClientePresenter(ClienteRepository()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const Scaffold(
          body: HomePage(),
        ),
        routes: {
          '/details': (ctx) => const ClienteDetails(),
        },
      ),
    );
  }
}

// PdfPreview(
//             maxPageWidth: 700,
//             build: (format) => cerfiticado(
//               format,
//               ClienteModel(
//                 id: 'id',
//                 nome: 'nome',
//                 rua: 'rua',
//                 numero: 'numero',
//                 bairro: 'bairro',
//                 cidade: 'cidade',
//                 estado: 'estado',
//                 cep: 'Cep',
//                 telefone: 'telefone',
//                 email: 'email',
//                 ambiente: 'cpf',
//                 cnpj: 'cnpj',
//               ),
//             ),
//           ),
