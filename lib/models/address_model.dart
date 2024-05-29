import 'package:investigators/generated/json/base/json_field.dart';
import 'dart:convert';

import '../generated/json/address_model.g.dart';

@JsonSerializable()
class AddressModel {
	@JSONField(name: "address_id")
	late String addressId;
	@JSONField(name: "full_address")
	late String fullAddress;
	late String type;
	@JSONField(name: "client_id")
	late String clientId;

	AddressModel();

	factory AddressModel.fromJson(Map<String, dynamic> json) => $AddressModelFromJson(json);

	Map<String, dynamic> toJson() => $AddressModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}