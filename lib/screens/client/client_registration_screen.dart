import 'package:flutter/material.dart';
import '../../controllers/client_controller.dart';
import '../../models/client.dart';

class ClientRegistrationScreen extends StatefulWidget {
  @override
  _ClientRegistrationScreenState createState() => _ClientRegistrationScreenState();
}

class _ClientRegistrationScreenState extends State<ClientRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _cpfCnpjController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cepController = TextEditingController();
  final _addressController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final ClientController _clientController = ClientController();

  @override
  void initState() {
    super.initState();
    _clientController.loadClients();
  }

  void _saveClient() {
    if (_formKey.currentState!.validate()) {
      final client = Client(
        id: int.parse(_idController.text),
        name: _nameController.text,
        type: _typeController.text,
        cpfCnpj: _cpfCnpjController.text,
        email: _emailController.text.isEmpty ? null : _emailController.text,
        phone: _phoneController.text.isEmpty ? null : _phoneController.text,
        cep: _cepController.text.isEmpty ? null : _cepController.text,
        address: _addressController.text.isEmpty ? null : _addressController.text,
        neighborhood: _neighborhoodController.text.isEmpty ? null : _neighborhoodController.text,
        city: _cityController.text.isEmpty ? null : _cityController.text,
        state: _stateController.text.isEmpty ? null : _stateController.text,
      );
      _clientController.addClient(client);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Client')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'ID'),
                validator: (value) =>
                    value!.isEmpty ? 'ID is required' : null,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Name is required' : null,
              ),
              TextFormField(
                controller: _typeController,
                decoration: InputDecoration(labelText: 'Type (F/J)'),
                validator: (value) =>
                    value!.isEmpty || !['F', 'J'].contains(value)
                        ? 'Type must be F or J'
                        : null,
              ),
              TextFormField(
                controller: _cpfCnpjController,
                decoration: InputDecoration(labelText: 'CPF/CNPJ'),
                validator: (value) =>
                    value!.isEmpty ? 'CPF/CNPJ is required' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              TextFormField(
                controller: _cepController,
                decoration: InputDecoration(labelText: 'CEP'),
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: _neighborhoodController,
                decoration: InputDecoration(labelText: 'Neighborhood'),
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'City'),
              ),
              TextFormField(
                controller: _stateController,
                decoration: InputDecoration(labelText: 'State'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveClient,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}