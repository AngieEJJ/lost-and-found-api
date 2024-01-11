import 'package:flutter/material.dart';
import 'package:ijkl/data/lost_item_api.dart';
import 'package:ijkl/screen/widget/search_bar_widget.dart';
import '../model/item.dart';

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
    super.initState();
  }


  void initData() async {
    result =  await lostItemApi.getData();
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
            SearchBarWidget(callback: searchItem),
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
