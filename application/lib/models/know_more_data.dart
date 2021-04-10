import 'dart:convert';

List<KnowMoreData> knowMoreDataFromJson(String str) => List<KnowMoreData>.from(json.decode(str).map((x) => KnowMoreData.fromJson(x)));

String knowMoreDataToJson(List<KnowMoreData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KnowMoreData {
  KnowMoreData({
    this.category,
    this.fact,
  });

  String category;
  String fact;

  factory KnowMoreData.fromJson(Map<String, dynamic> json) => KnowMoreData(
    category: json["category"],
    fact: json["fact"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "fact": fact,
  };


  static List<KnowMoreData> knowMoreList = <KnowMoreData>[
    KnowMoreData(
      category: 'Data Ownership',
      fact: 'Number of companies that have your data. How to improve: Restrict Access to companies.',
    ),
    KnowMoreData(
      category: 'Data Privacy',
      fact: 'The amount of Information companies know about you. How to Improve: Change privacy settings.',
    ),
    KnowMoreData(
      category: 'Profile Safety',
      fact: 'How easy it is to collect information from you. How to improve: Accepting less cookies and putting less information public.',
    ),
  ];

}