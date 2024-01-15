import 'package:ijkl/data/repository/item_repository_impl.dart';
import '../data/model/item.dart';

class MainViewModel {
 final repository = ItemRepositoryImpl();
  List<Item> filterdResult = [];

  @override
  Future<List<Item>> filterData(String query) async {
    final itemList = await repository.getItemData(query);

    filterdResult =
        itemList.where((item) => item.name.contains(query)).toList();

    return filterdResult;
  }
}