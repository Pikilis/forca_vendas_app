import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/client.dart';

class ClientController {
  List<Client> clients = [];

  Future<void> loadClients() async {
  final file = await _getFile('clients.json');

  if (!(await file.exists())) {
    await file.writeAsString('[]'); // cria com lista vazia
  }

    final contents = await file.readAsString();
    final List<dynamic> jsonList = jsonDecode(contents);
    clients = jsonList.map((e) => Client.fromJson(e)).toList();
  }

  Future<void> saveClients() async {
    final file = await _getFile('clients.json');
    await file.writeAsString(jsonEncode(clients));
  }

  Future<void> addClient(Client client) async {
    clients.add(client);
    await saveClients();
  }

  Future<void> updateClient(int id, Client updatedClient) async {
    final index = clients.indexWhere((client) => client.id == id);
    if (index != -1) {
      clients[index] = updatedClient;
      await saveClients();
    }
  }

  Future<void> deleteClient(int id) async {
    clients.removeWhere((client) => client.id == id);
    await saveClients();
  }

  Future<File> _getFile(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$filename');
  }
}