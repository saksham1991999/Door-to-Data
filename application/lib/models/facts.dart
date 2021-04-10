import 'dart:convert';

List<Fact> factFromJson(String str) => List<Fact>.from(json.decode(str).map((x) => Fact.fromJson(x)));

String factToJson(List<Fact> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fact {
  Fact({
    this.category,
    this.fact,
  });

  String category;
  String fact;

  factory Fact.fromJson(Map<String, dynamic> json) => Fact(
    category: json["category"],
    fact: json["fact"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "fact": fact,
  };
}
