class Item { //팩토리 메서드를 안 쓸 경우 ?를 안 하면 에러가 난다.
  String name;
  String status;
  String date;
  String place;

  Item({
    required this.name,
    required this.status,
    required this.date,
    required this.place,
  });

  factory Item.fromJson(Map<String, dynamic> json) { //팩토리: 객체를 만들어서 대신 넘겨준다.  = 메서드
    return Item( //item 객체 생성 후 호출
      name: json['GET_NAME'] as String,
      status: json['STATUS'] as String,
      date: json['GET_DATE'] as String,
      place: json['GET_POSITION'] as String,
    );
  }

  // Item.fromJson(Map<String, dynamic> json) { //객체를 만듦 = 생성자
  //   name = json['GET_NAME'];
  //   status = json['STATUS'];
  //   date = json['GET_DATE'];
  //   place = json['GET_POSITION'];
  // }
}
