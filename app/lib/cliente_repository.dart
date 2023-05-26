import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'cliente_model.dart';

class ClienteRepository {
  var dio = Dio();

  List<ClienteModel> _clientes = [];
  List<ClienteModel> get clientes => [..._clientes];

  int get clientesCount {
    return _clientes.length;
  }

  ClienteRepository([
    this._clientes = const [],
  ]);

  Future<void> save(ClienteModel data) async {
    bool hasId = data.id.isNotEmpty;
    final cliente = ClienteModel(
      id: hasId ? data.id : Random().nextDouble().toString(),
      nome: data.nome,
      rua: data.rua,
      numero: data.numero,
      bairro: data.bairro,
      cidade: data.cidade,
      estado: data.estado,
      ambiente: data.ambiente,
      cnpj: data.cnpj,
    );
    await addCliente(cliente);
  }

  Future<void> addCliente(ClienteModel data) async {
    final date = DateTime.now();
    final response = await dio.post(
      'https://certi-pest-default-rtdb.firebaseio.com/clientes.json',
      data: {
        "nome": data.nome,
        "rua": data.rua,
        "numero": data.numero,
        "bairro": data.bairro,
        "cidade": data.cidade,
        "estado": data.estado,
        "ambiente": data.ambiente,
        "cnpj": data.cnpj,
      },
    );
    final id = response.data['name'];
    _clientes.add(
      ClienteModel(
        id: id,
        nome: data.nome,
        rua: data.rua,
        numero: data.numero,
        bairro: data.bairro,
        cidade: data.cidade,
        estado: data.estado,
        ambiente: data.ambiente,
        cnpj: data.cnpj,
      ),
    );
  }

  Future<List<ClienteModel>> loadClientes() async {
    try {
      final response = await dio
          .get('https://certi-pest-default-rtdb.firebaseio.com/clientes.json');

      if (response.data == null) {
        return [];
      }
      Map<String, dynamic> data = response.data;
      print(response.data);

      if (data.isEmpty) {
        _clientes = [];
      }

      List<ClienteModel> newClientes = [];

      data.forEach((clienteId, clienteData) {
        final id = clienteId;
        final nome = clienteData['nome'];
        final rua = clienteData['rua'];
        final numero = clienteData['numero'];
        final bairro = clienteData['bairro'];
        final cidade = clienteData['cidade'];
        final estado = clienteData['estado'];
        final ambiente = clienteData['ambiente'];
        final cnpj = clienteData['cnpj'];

        newClientes.add(
          ClienteModel(
            id: id,
            nome: nome,
            rua: rua,
            numero: numero,
            bairro: bairro,
            cidade: cidade,
            estado: estado,
            ambiente: ambiente,
            cnpj: cnpj,
          ),
        );
      });

      if (!listEquals(_clientes, newClientes)) {
        _clientes = newClientes;
      }
      return _clientes;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
