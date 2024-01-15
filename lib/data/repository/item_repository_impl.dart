import 'package:ijkl/data/repository/item_repository.dart';
import 'package:ijkl/data/source/lost_item_api.dart';
import '../model/item.dart';

class ItemRepositoryImpl implements ItemRepository {
  LostItemApi lostItemApi = LostItemApi();
  List<Item> result = [];

  @override
  Future<List<Item>> getItemData(String query) async {
   final rawData = await lostItemApi.getData();
    List resultData = rawData.lostArticleInfo!.row!.toList();
    result = resultData.map((e) => Item.fromJson(e)).toList();
    return result;
  }
}


