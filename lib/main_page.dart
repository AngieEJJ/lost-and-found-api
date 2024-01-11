import 'package:flutter/material.dart';
import 'package:ijkl/data/lost_item_api.dart';
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
  final LostItemApi lostItemApi = LostItemApi();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    initData();
    // lostItemApi.getData().then((value) { // value를 어떻게 하겠다. 28번 29번 = listItem result로 가져오기만 하고 할당이 없음. result에 value 할당.
    //   result = value; //vlaue에 result를 넣어줌
    //   searchItem("");
    // });
    super.initState();
  }


  void initData() async {
    result =  await lostItemApi.getData(); //final을 붙이면 여기서만 쓸 수 있음.
    searchItem("");
  }

  void searchItem(String query) {
    setState(() {
      filterdResult = result
          .where((e) => e.name.contains(query))
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
