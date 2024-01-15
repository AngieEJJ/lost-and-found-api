import '../model/item.dart';

abstract interface class ItemRepository {
  Future<List<Item>> getItemData (String query);
}