import 'package:flutter/material.dart';
import 'package:ijkl/data/lost_item_api.dart';
import 'package:ijkl/model/item.dart';
import 'package:ijkl/model/item_repository.dart';
import 'widget/search_bar_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List <Item>result = [];

  final TextEditingController controller = TextEditingController();
  final LostItemApi lostItemApi = LostItemApi();
  ItemRepository itemRepository = ItemRepository();

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
    await itemRepository.searchItem(""); //search함수는 퓨처니까 await 필요 // ""가 들어가면 빈값으로 초기화 시킴
  setState(() {

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
            SearchBarWidget(onSearch: itemRepository.searchItem),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  itemCount: itemRepository.filterdResult.length,
                  itemBuilder: (context, index) {
                    print(itemRepository.filterdResult.length);
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
                                '분실물: ${itemRepository.filterdResult[index].name}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '상태: ${itemRepository.filterdResult[index].status}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '수령일자: ${itemRepository.filterdResult[index].date}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '수령장소: ${itemRepository.filterdResult[index].place}',
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
