import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'model/item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List <Item>result = [];
  List <Item>filterdResult = [];
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
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

List rawData = response.data['lostArticleInfo']['row']; //  result = response.data['lostArticleInfo']['row'];
    result = rawData.map((e) => Item.fromJson(e)).toList();
      searchItem("");
  }



  void searchItem(String query) {
    setState(() {
      filterdResult = result
          .where((e) => e.name.contains(query)) //e['GET_NAME'].toString().contains(query))
          .toList();
      //e['GET_NAME'].toString()을 통해 Map에서 'GET_NAME' 키에 해당하는 값을 문자열로 변환/ Item 모델에서 name은 이미 문자열 타입
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
              controller: controller,
              decoration: InputDecoration(
                labelText: '분실물을 입력하세요',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    searchItem(controller.text);
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  itemCount: filterdResult.length,
                  itemBuilder: (context, index) {
                    // print('분실물: ${result[index]}');
                    return Card(
                      child: Container(
                        height: 280,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '분실물: ${filterdResult[index].name}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '상태: ${filterdResult[index].status}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '수령일자: ${filterdResult[index].date}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '수령장소: ${filterdResult[index].place}',
                                style: const TextStyle(fontSize: 20),
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
