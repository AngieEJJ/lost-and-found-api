import 'package:flutter/material.dart';
import 'package:ijkl/data/repository/item_repository_impl.dart';
import 'package:ijkl/ui/main_view_model.dart';
import 'widget/search_bar_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController controller = TextEditingController();
  final ItemRepositoryImpl itemRepository = ItemRepositoryImpl();

  final viewModel = MainViewModel();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
itemRepository.getItemData("");
    super.initState();
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
            SearchBarWidget(onSearch: itemRepository.getItemData),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  itemCount: viewModel.filterdResult.length,
                  itemBuilder: (context, index) {
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
                                '분실물: ${viewModel.filterdResult[index].name}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '상태: ${viewModel.filterdResult[index].status}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '수령일자: ${viewModel.filterdResult[index].date}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '수령장소: ${viewModel.filterdResult[index].place}',
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
