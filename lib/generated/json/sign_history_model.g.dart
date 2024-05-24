import 'package:investigators/generated/json/base/json_convert_content.dart';
import 'package:investigators/models/sign_history_model.dart';

SignHistoryModel $SignHistoryModelFromJson(Map<String, dynamic> json) {
  final SignHistoryModel signHistoryModel = SignHistoryModel();
  final String? month = jsonConvert.convert<String>(json['month']);
  if (month != null) {
    signHistoryModel.month = month;
  }
  final String? signSuccessCount = jsonConvert.convert<String>(json['sign_success_count']);
  if (signSuccessCount != null) {
    signHistoryModel.signSuccessCount = signSuccessCount;
  }
  return signHistoryModel;
}

Map<String, dynamic> $SignHistoryModelToJson(SignHistoryModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['month'] = entity.month;
  data['sign_success_count'] = entity.signSuccessCount;
  return data;
}

extension SignHistoryModelExtension on SignHistoryModel {
  SignHistoryModel copyWith({
    String? month,
    String? signSuccessCount,
  }) {
    return SignHistoryModel()
      ..month = month ?? this.month
      ..signSuccessCount = signSuccessCount ?? this.signSuccessCount;
  }
}