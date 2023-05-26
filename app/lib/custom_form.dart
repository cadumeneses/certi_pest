import 'package:app/cliente_model.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import 'certificado.dart';
import 'data_model.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key, required this.cliente});
  final ClienteModel cliente;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  final _data = CustomData();

  List<String> pestList = [
    'LIMPEZA DE CAIXA D\'ÁGUA',
    'ARANHA',
    'BARATA',
    'CARRAPATO',
    'COVID',
    'CUPIM',
    'MOSQUITO DA DENGUE',
    'ESCORPIÃO',
    'FORMIGA',
    'MORCEGO',
    'PULGA',
    'RATO',
    'TRAÇA',
    'POMBO',
  ];

  List<String> productList = [
    'Cyperex',
    'Cipermetrina',
    'DDPV',
    'Demand',
    'Lankon',
    'Fipronol',
    'Ratolbioc',
    'Ri do rato pó'
  ];

  Future<void> _submitForm(ClienteModel cliente) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => PdfPreview(
          build: (format) => cerfiticado(format, cliente, _data),
        ),
      ));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulário enviado com sucesso!')),
      );
    }
  }

  TextStyle style = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preencha o Formulário'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Data de Execução:', style: style),
              InkWell(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2025),
                  ).then((date) {
                    if (date != null) {
                      setState(() {
                        _data.executionDate = date;
                      });
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Text(
                    _data.executionDate != null
                        ? '${_data.executionDate!.day}/${_data.executionDate!.month}/${_data.executionDate!.year}'
                        : 'Selecione a data',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text('Validade (em dias):', style: style),
              DropdownButtonFormField<int>(
                value: _data.validityInDays,
                onChanged: (value) {
                  setState(() {
                    _data.validityInDays = value;
                  });
                },
                items: const [
                  DropdownMenuItem<int>(
                    value: 90,
                    child: Text('90 dias'),
                  ),
                  DropdownMenuItem<int>(
                    value: 150,
                    child: Text('150 dias'),
                  ),
                ],
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione a validade';
                  }
                  return null;
                },
                onSaved: (value) {
                  _data.validityInDays = value;
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Text('Pragas:', style: style),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: pestList.map((pest) {
                  return ChoiceChip(
                    label: Text(pest),
                    selected: _data.selectedPests.contains(pest),
                    selectedColor: Colors.blueAccent,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _data.selectedPests.add(pest);
                        } else {
                          _data.selectedPests.remove(pest);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Text('Produtos Utilizados:', style: style),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: productList.map((product) {
                  return ChoiceChip(
                    label: Text(product),
                    selected: _data.selectedProducts.contains(product),
                    selectedColor: Colors.blueAccent,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _data.selectedProducts.add(product);
                        } else {
                          _data.selectedProducts.remove(product);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () => _submitForm(widget.cliente),
                  child: Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Enviar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
