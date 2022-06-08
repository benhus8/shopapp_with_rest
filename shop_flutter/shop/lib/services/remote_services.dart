import 'dart:convert';
import 'package:http/http.dart' as http;

class Products {
  Products({
    required this.id,
    required this.kategoria,
    required this.nazwa,
    required this.cena,
  });

  int id;
  String? kategoria;
  String? nazwa;
  double? cena;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        kategoria: json["kategoria"],
        nazwa: json["nazwa"],
        cena: json["cena"].toDouble(),
      );
}

Future<List<Products>> getProducts() async {
  final response = await http.get(
    Uri.parse('http://10.0.2.2:8080/shop'),
  );
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    List<Products> products = [];
    for (var u in jsonResponse) {
      Products product = Products(
        id: u['id'],
        nazwa: u['nazwa'],
        kategoria: u['kategoria'],
        cena: u['cena'],
      );

      products.add(product);
    }
    return products;
  } else {
    throw Exception('Nie udalo się zaladowac bazy danych');
  }
}
