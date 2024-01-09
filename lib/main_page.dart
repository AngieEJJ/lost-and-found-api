import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List result = [];
  List filteredResult = [];
  final TextEditingController controller = TextEditingController(); //선언

  @override
  void dispose() {
    controller.dispose(); //사용완료 후 제거
    super.dispose();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Dio dio = Dio();

  Future getData() async {
    final response = await dio.get(
        'http://openapi.seoul.go.kr:8088/sample/json/lostArticleInfo/1/5/');
    // print(response.data['lostArticleInfo']['row'][0]['ID']);

    setState(() {
      result = response.data['lostArticleInfo']['row'];

      // print(result);
    });
  }

  void searchItem(String query) { //검색 함수 : query -> 매개변수
    setState(() {
      filteredResult = result.where((item) => item['GET_NAME'].toString().contains(query)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('분실물 찾기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: controller, // 연결
              onChanged: (value) {
                searchItem(controller.text);
                // print(controller.text);
              },
              decoration: const InputDecoration(
                labelText: '분실물을 입력하세요',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (filteredResult.isNotEmpty ? filteredResult.length : result.length),
                  itemBuilder: (context, index) {
                    var itemData = (filteredResult.isNotEmpty ? filteredResult[index] : result[index]);
                    return Card(
                      child: Container(
                        height: 280,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text('분실물: ${itemData['GET_NAME']}', style: const TextStyle(fontSize: 20),),
                          Text('상태: ${itemData['STATUS']}', style: const TextStyle(fontSize: 20),),
                          Text('수령일자: ${itemData['GET_DATE']}', style: const TextStyle(fontSize: 20),),
                          Text('수령장소: ${itemData['TAKE_PLACE']}', style: const TextStyle(fontSize: 20),
                          ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
