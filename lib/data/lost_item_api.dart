import 'package:dio/dio.dart';
import '../model/item.dart';

class LostItemApi {
  Future<List<Item>> getData() async {
    Dio dio = Dio();
    List<Item> result = [];

    final response = await dio.get(
        'http://openapi.seoul.go.kr:8088/sample/json/lostArticleInfo/1/5/');
    List rawData = response.data['lostArticleInfo']['row'];
    result = rawData.map((e) => Item.fromJson(e)).toList();
    // print(rawData);
    return result;
  }
}
