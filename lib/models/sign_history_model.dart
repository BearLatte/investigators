import 'package:investigators/generated/json/base/json_field.dart';
import 'package:investigators/generated/json/sign_history_model.g.dart';
import 'dart:convert';
export 'package:investigators/generated/json/sign_history_model.g.dart';

@JsonSerializable()
class SignHistoryModel {
	late String month;
	@JSONField(name: "sign_success_count")
	late String signSuccessCount;

	SignHistoryModel();

	factory SignHistoryModel.fromJson(Map<String, dynamic> json) => $SignHistoryModelFromJson(json);

	Map<String, dynamic> toJson() => $SignHistoryModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}