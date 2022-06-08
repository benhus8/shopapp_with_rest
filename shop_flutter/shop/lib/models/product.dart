import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    required this.id,
    this.kategoria,
    required this.nazwa,
    this.krajPochodzenia,
    required this.cena,
    this.dostepnosc,
  });

  int id;
  String? kategoria;
  String nazwa;
  String? krajPochodzenia;
  double? cena;
  bool? dostepnosc; //? - oznacza że jest opcjonalne

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        kategoria: json["kategoria"],
        nazwa: json["nazwa"],
        krajPochodzenia: json["kraj_pochodzenia"],
        cena: json["cena"].toDouble(),
        dostepnosc: json["dostepnosc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategoria": kategoria,
        "nazwa": nazwa,
        "kraj_pochodzenia": krajPochodzenia,
        "cena": cena,
        "dostepnosc": dostepnosc,
      };
}
