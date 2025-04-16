class Client {
  int id;
  String name;
  String type; // F - Physical / J - Legal
  String cpfCnpj;
  String? email;
  String? phone;
  String? cep;
  String? address;
  String? neighborhood;
  String? city;
  String? state;

  Client({
    required this.id,
    required this.name,
    required this.type,
    required this.cpfCnpj,
    this.email,
    this.phone,
    this.cep,
    this.address,
    this.neighborhood,
    this.city,
    this.state,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'cpfCnpj': cpfCnpj,
        'email': email,
        'phone': phone,
        'cep': cep,
        'address': address,
        'neighborhood': neighborhood,
        'city': city,
        'state': state,
      };

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        cpfCnpj: json['cpfCnpj'],
        email: json['email'],
        phone: json['phone'],
        cep: json['cep'],
        address: json['address'],
        neighborhood: json['neighborhood'],
        city: json['city'],
        state: json['state'],
      );
}