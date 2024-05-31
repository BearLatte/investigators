import 'package:investigators/generated/json/base/json_convert_content.dart';
import 'package:investigators/models/asset_options.dart';
import 'package:investigators/models/subcategory.dart';


AssetOptions $AssetOptionsFromJson(Map<String, dynamic> json) {
  final AssetOptions assetOptions = AssetOptions();
  final List<Subcategory>? investmentCertificate = (json['investment_certificate'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<Subcategory>(e) as Subcategory).toList();
  if (investmentCertificate != null) {
    assetOptions.investmentCertificate = investmentCertificate;
  }
  final List<Subcategory>? livestockAssets = (json['livestock_assets'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<Subcategory>(e) as Subcategory).toList();
  if (livestockAssets != null) {
    assetOptions.livestockAssets = livestockAssets;
  }
  final List<Subcategory>? motorVehicles = (json['motor_vehicles'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<Subcategory>(e) as Subcategory).toList();
  if (motorVehicles != null) {
    assetOptions.motorVehicles = motorVehicles;
  }
  final List<Subcategory>? monthlyIncome = (json['monthly_income'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<Subcategory>(e) as Subcategory).toList();
  if (monthlyIncome != null) {
    assetOptions.monthlyIncome = monthlyIncome;
  }
  final List<Subcategory>? lastMonthTransactionFlow = (json['last_month_transaction_flow'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<Subcategory>(e) as Subcategory).toList();
  if (lastMonthTransactionFlow != null) {
    assetOptions.lastMonthTransactionFlow = lastMonthTransactionFlow;
  }
  return assetOptions;
}

Map<String, dynamic> $AssetOptionsToJson(AssetOptions entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['investment_certificate'] = entity.investmentCertificate.map((v) => v.toJson()).toList();
  data['livestock_assets'] = entity.livestockAssets.map((v) => v.toJson()).toList();
  data['motor_vehicles'] = entity.motorVehicles.map((v) => v.toJson()).toList();
  data['monthly_income'] = entity.monthlyIncome.map((v) => v.toJson()).toList();
  data['last_month_transaction_flow'] = entity.lastMonthTransactionFlow.map((v) => v.toJson()).toList();
  return data;
}

extension AssetOptionsExtension on AssetOptions {
  AssetOptions copyWith({
    List<Subcategory>? investmentCertificate,
    List<Subcategory>? livestockAssets,
    List<Subcategory>? motorVehicles,
    List<Subcategory>? monthlyIncome,
    List<Subcategory>? lastMonthTransactionFlow,
  }) {
    return AssetOptions()
      ..investmentCertificate = investmentCertificate ?? this.investmentCertificate
      ..livestockAssets = livestockAssets ?? this.livestockAssets
      ..motorVehicles = motorVehicles ?? this.motorVehicles
      ..monthlyIncome = monthlyIncome ?? this.monthlyIncome
      ..lastMonthTransactionFlow = lastMonthTransactionFlow ?? this.lastMonthTransactionFlow;
  }
}