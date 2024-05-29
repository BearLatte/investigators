import 'package:investigators/generated/json/base/json_convert_content.dart';
import 'package:investigators/models/subcategory.dart';

Subcategory $SubcategoryFromJson(Map<String, dynamic> json) {
  final Subcategory subcategory = Subcategory();
  final String? cateId = jsonConvert.convert<String>(json['cate_id']);
  if (cateId != null) {
    subcategory.cateId = cateId;
  }
  final String? cateName = jsonConvert.convert<String>(json['cate_name']);
  if (cateName != null) {
    subcategory.cateName = cateName;
  }
  return subcategory;
}

Map<String, dynamic> $SubcategoryToJson(Subcategory entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cate_id'] = entity.cateId;
  data['cate_name'] = entity.cateName;
  return data;
}

extension SubcategoryExtension on Subcategory {
  Subcategory copyWith({
    String? cateId,
    String? cateName,
  }) {
    return Subcategory()
      ..cateId = cateId ?? this.cateId
      ..cateName = cateName ?? this.cateName;
  }
}