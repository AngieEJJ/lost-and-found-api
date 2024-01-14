import 'package:ijkl/data/lost_item_api.dart';

import 'item.dart';


class ItemRepository {
  LostItemApi lostItemApi = LostItemApi();
  List<Item> result = [];
  List<Item> filterdResult = [];

  Future<List<Item>> searchItem(String query) async {
    result = await lostItemApi.getData();
    filterdResult = result.where((e) => e.name.contains(query)).toList();
    // print(filterdResult);
    return filterdResult;
  }
}
