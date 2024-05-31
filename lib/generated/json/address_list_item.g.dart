import 'package:investigators/generated/json/base/json_convert_content.dart';
import 'package:investigators/models/address_list_item.dart';

AddressListItem $AddressListItemFromJson(Map<String, dynamic> json) {
  final AddressListItem addressListItem = AddressListItem();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    addressListItem.name = name;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    addressListItem.code = code;
  }
  return addressListItem;
}

Map<String, dynamic> $AddressListItemToJson(AddressListItem entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['code'] = entity.code;
  return data;
}

extension AddressListItemExtension on AddressListItem {
  AddressListItem copyWith({
    String? name,
    String? code,
  }) {
    return AddressListItem()
      ..name = name ?? this.name
      ..code = code ?? this.code;
  }
}