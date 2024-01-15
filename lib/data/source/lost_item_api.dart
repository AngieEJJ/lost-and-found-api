import 'package:dio/dio.dart';
import '../dto/lost_and_found_dto.dart';

class LostItemApi {
  Future<LostAndFoundDto> getData() async {
    Dio dio = Dio();

    final response = await dio.get(
        'http://openapi.seoul.go.kr:8088/sample/json/lostArticleInfo/1/5/');
    // print(response.data.runtimeType); //JsonMap

    return response.data;
  }
}
