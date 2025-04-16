import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/client.dart';

class ClientController {
  List<Client> clients = [];

  Future<void> loadClients() async {
    final file = await _getFile('clients.json');
    if (await file.exists()) {
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      clients = json.map((e) => Client.fromJson(e)).toList();
    }
  }

  Future<void> saveClients() async {
    final file = await _getFile('clients.json');
    await file.writeAsString(jsonEncode(clients));
  }

  void addClient(Client client) {
    clients.add(client);
    saveClients();
  }

  void updateClient(int id, Client updatedClient) {
    final index = clients.indexWhere((client) => client.id == id);
    if (index != -1) {
      clients[index] = updatedClient;
      saveClients();
    }
  }

  void deleteClient(int id) {
    clients.removeWhere((client) => client.id == id);
    saveClients();
  }

  Future<File> _getFile(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$filename');
  }
}