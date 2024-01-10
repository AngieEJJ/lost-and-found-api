import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List result = [];
  List filterdResult = [];
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
    // print(response.data['lostArticleInfo']['row'][0]['ID']);

      result = response.data['lostArticleInfo']['row'];
      searchItem("");
      // print(result);
      // print(result[0]);
      // print(result.length);
    // });
  }

  void searchItem(String query) {
    setState(() {
      filterdResult = result
          .where((item) => item['GET_NAME'].toString().contains(query))
          .toList();
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
                                '분실물: ${filterdResult[index]['GET_NAME']}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '상태: ${filterdResult[index]['STATUS']}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '수령일자: ${filterdResult[index]['GET_DATE']}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '수령장소: ${filterdResult[index]['TAKE_PLACE']}',
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
