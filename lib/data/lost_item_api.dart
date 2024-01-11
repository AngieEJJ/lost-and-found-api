import 'package:dio/dio.dart';
import '../model/item.dart';

class LostItemApi {
  Future<List<Item>> getData() async {
    Dio dio = Dio();
    List<Item> result = []; // getData 함수에서만 사용하는 변수이기 때문에 전역이 아닌 지역으로 위치시킴

    final response = await dio.get(
        'http://openapi.seoul.go.kr:8088/sample/json/lostArticleInfo/1/5/');

    List rawData = response.data['lostArticleInfo']['row'];
    result = rawData.map((e) => Item.fromJson(e)).toList();
    return result;  // 가져다 쓰는건데 뭘 보여줄 건지가 없으니까 리턴값이 필요하다. (연결문제)
  }
}
