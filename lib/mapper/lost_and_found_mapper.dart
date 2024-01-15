import '../data/dto/lost_and_found_dto.dart';
import '../model/item.dart';

extension DtoModel on Row {
  Item toModel() {
    return Item (
      name: 'GET_NAME' ?? '_',
      status: 'STATUS' ?? '_',
      date: 'GET_DATE' ?? '_',
      place: 'GET_POSITION' ?? '_',
    );
  }
}