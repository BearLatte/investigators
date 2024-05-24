import 'package:investigators/generated/json/base/json_convert_content.dart';
import 'package:investigators/models/user_model.dart';

UserModel $UserModelFromJson(Map<String, dynamic> json) {
  final UserModel userModel = UserModel();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userModel.name = name;
  }
  final String? telephone = jsonConvert.convert<String>(json['telephone']);
  if (telephone != null) {
    userModel.telephone = telephone;
  }
  final String? chargeLocation = jsonConvert.convert<String>(json['charge_location']);
  if (chargeLocation != null) {
    userModel.chargeLocation = chargeLocation;
  }
  final String? chargeAddress = jsonConvert.convert<String>(json['charge_address']);
  if (chargeAddress != null) {
    userModel.chargeAddress = chargeAddress;
  }
  return userModel;
}

Map<String, dynamic> $UserModelToJson(UserModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['telephone'] = entity.telephone;
  data['charge_location'] = entity.chargeLocation;
  data['charge_address'] = entity.chargeAddress;
  return data;
}

extension UserModelExtension on UserModel {
  UserModel copyWith({
    String? name,
    String? telephone,
    String? chargeLocation,
    String? chargeAddress,
  }) {
    return UserModel()
      ..name = name ?? this.name
      ..telephone = telephone ?? this.telephone
      ..chargeLocation = chargeLocation ?? this.chargeLocation
      ..chargeAddress = chargeAddress ?? this.chargeAddress;
  }
}