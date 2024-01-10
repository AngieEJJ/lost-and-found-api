class Item {
  String? name;
  String? status;
  String? date;
  String? place;

  Item({
    required this.name,
    required this.status,
    required this.date,
    required this.place,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'] as String,
      status: json['status'] as String,
      date: json['date'] as String,
      place: json['place'] as String,
    );
  }

  // Item.fromJson(Map<String, dynamic> json) {
  //   name = json['GET_NAME'];
  //   status = json['STATUS'];
  //   date = json['GET_DATE'];
  //   place = json['GET_POSITION'];
  // }
}
