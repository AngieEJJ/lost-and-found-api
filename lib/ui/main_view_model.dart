import '../model/item.dart';
import '../model/item_repository.dart';

class MainViewModel {
  final ItemRepository itemRepository = ItemRepository();
  List<Item> result = [];
  List<Item> initialData = [];

  Future<List<Item>> initData(String query) async {
  result = await itemRepository.searchItem("");
  initialData = result.where((e) => e.name.contains(query)).toList();
  // print(initialData);
  return initialData;


  }
}
