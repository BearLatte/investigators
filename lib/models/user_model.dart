import 'package:investigators/generated/json/base/json_field.dart';
import 'dart:convert';

import '../generated/json/user_model.g.dart';

@JsonSerializable()
class UserModel {
  late String name;
  late String telephone;
  @JSONField(name: "charge_location")
  late String chargeLocation;
  @JSONField(name: "charge_address")
  late String chargeAddress;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) => $UserModelFromJson(json);

  Map<String, dynamic> toJson() => $UserModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
