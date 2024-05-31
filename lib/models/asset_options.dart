import 'package:investigators/generated/json/base/json_field.dart';
import 'dart:convert';

import 'package:investigators/models/subcategory.dart';

import '../generated/json/asset_options.g.dart';

@JsonSerializable()
class AssetOptions {
  @JSONField(name: "investment_certificate")
  late List<Subcategory> investmentCertificate;
  @JSONField(name: "livestock_assets")
  late List<Subcategory> livestockAssets;
  @JSONField(name: "motor_vehicles")
  late List<Subcategory> motorVehicles;
  @JSONField(name: "monthly_income")
  late List<Subcategory> monthlyIncome;
  @JSONField(name: "last_month_transaction_flow")
  late List<Subcategory> lastMonthTransactionFlow;

  AssetOptions();

  factory AssetOptions.fromJson(Map<String, dynamic> json) => $AssetOptionsFromJson(json);

  Map<String, dynamic> toJson() => $AssetOptionsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
