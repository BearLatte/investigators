import 'package:investigators/generated/json/base/json_field.dart';
import 'dart:convert';

import '../generated/json/subcategory.g.dart';

@JsonSerializable()
class Subcategory {
  @JSONField(name: "cate_id")
  late String cateId;
  @JSONField(name: "cate_name")
  late String cateName;

  Subcategory();

  factory Subcategory.fromJson(Map<String, dynamic> json) => $SubcategoryFromJson(json);

  Map<String, dynamic> toJson() => $SubcategoryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
