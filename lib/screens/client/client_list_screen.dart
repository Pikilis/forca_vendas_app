import 'package:flutter/material.dart';
import '../../controllers/client_controller.dart';
import 'client_registration_screen.dart';

class ClientListScreen extends StatefulWidget {
  @override
  _ClientListScreenState createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  final ClientController _clientController = ClientController();

@override
void initState() {
  super.initState();
  _loadData();
}

void _loadData() async {
  await _clientController.loadClients();
  setState(() {}); // Agora ele atualiza a tela após carregar os dados
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clients')),
      body: ListView.builder(
        itemCount: _clientController.clients.length,
        itemBuilder: (context, index) {
          final client = _clientController.clients[index];
          return ListTile(
            title: Text(client.name),
            subtitle: Text('CPF/CNPJ: ${client.cpfCnpj}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Implement edit functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _clientController.deleteClient(client.id);
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClientRegistrationScreen()),
          ).then((_) => _loadData());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}