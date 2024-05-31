import 'package:investigators/generated/json/base/json_field.dart';
import 'dart:convert';

import '../generated/json/address_list_item.g.dart';

@JsonSerializable()
class AddressListItem {
  late String name;
  late String code;

  String get prefix {
    return name.substring(0, 1);
  }

  AddressListItem();

  factory AddressListItem.fromJson(Map<String, dynamic> json) => $AddressListItemFromJson(json);

  Map<String, dynamic> toJson() => $AddressListItemToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
