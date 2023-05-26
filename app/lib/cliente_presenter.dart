

import 'package:flutter/material.dart';

import 'cliente_model.dart';
import 'cliente_repository.dart';

class ClientePresenter with ChangeNotifier {
  final ClienteRepository _repository;
  bool _isLoading = false;
  String _error = '';

  List<ClienteModel> _clientes = [];
  List<ClienteModel> get clientes => _clientes;

  ClientePresenter(this._repository);

  Future<void> submitForm(
    String nome,
    String rua,
    String numero,
    String bairro,
    String cidade,
    String estado,
    String ambiente,
    String cnpj,
  ) async {
    _isLoading = true;
    _error = '';

    try {
      await _repository.save(ClienteModel(
        id: '',
        nome: nome,
        rua: rua,
        numero: numero,
        bairro: bairro,
        cidade: cidade,
        estado: estado,
        ambiente: ambiente,
        cnpj: cnpj,
      ));
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadProjects() async {
    _isLoading = true;
    _error = '';

    try {
      _clientes = await _repository.loadClientes();
    } catch (e) {
      _error = e.toString();
    } finally {
      debugPrint(_clientes.toString());
      _isLoading = false;
      notifyListeners();
    }
  }
}
