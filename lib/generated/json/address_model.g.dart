import 'package:investigators/generated/json/base/json_convert_content.dart';
import 'package:investigators/models/address_model.dart';

AddressModel $AddressModelFromJson(Map<String, dynamic> json) {
  final AddressModel addressModel = AddressModel();
  final String? addressId = jsonConvert.convert<String>(json['address_id']);
  if (addressId != null) {
    addressModel.addressId = addressId;
  }
  final String? fullAddress = jsonConvert.convert<String>(json['full_address']);
  if (fullAddress != null) {
    addressModel.fullAddress = fullAddress;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    addressModel.type = type;
  }
  final String? clientId = jsonConvert.convert<String>(json['client_id']);
  if (clientId != null) {
    addressModel.clientId = clientId;
  }
  return addressModel;
}

Map<String, dynamic> $AddressModelToJson(AddressModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['address_id'] = entity.addressId;
  data['full_address'] = entity.fullAddress;
  data['type'] = entity.type;
  data['client_id'] = entity.clientId;
  return data;
}

extension AddressModelExtension on AddressModel {
  AddressModel copyWith({
    String? addressId,
    String? fullAddress,
    String? type,
    String? clientId,
  }) {
    return AddressModel()
      ..addressId = addressId ?? this.addressId
      ..fullAddress = fullAddress ?? this.fullAddress
      ..type = type ?? this.type
      ..clientId = clientId ?? this.clientId;
  }
}