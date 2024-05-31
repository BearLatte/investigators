import 'package:investigators/generated/json/base/json_field.dart';
import 'package:investigators/models/subcategory.dart';
import 'dart:convert';

import '../generated/json/interview_cache_model.g.dart';
import 'interview_detail_info.dart';

@JsonSerializable()
class InterviewCacheModel {
  @JSONField(name: "name_status")
  bool? nameStatus;
  @JSONField(name: "residential_status")
  int? residentialStatus;
  @JSONField(name: "company_status")
  int? companyStatus;
  bool? isInPerson;
  @JSONField(name: "other_identification_photos")
  late List<String> otherIdentificationPhotos;
  @JSONField(name: "salary_asset")
  InterviewCacheModelSalaryAsset? salaryAsset;
  @JSONField(name: "investment_info")
  InterviewCacheModelInvestmentInfo? investmentInfo;
  @JSONField(name: "incumbency_info")
  InterviewCacheModelIncumbencyInfo? incumbencyInfo;
  @JSONField(name: "land_asset")
  InterviewCacheModelLandAsset? landAsset;
  @JSONField(name: "house_asset")
  InterviewCacheModelHouseAsset? houseAsset;
  @JSONField(name: "business_asset")
  InterviewCacheModelBusinessAsset? businessAsset;
  @JSONField(name: "livestock_asset")
  InterviewCacheModelLivestockAsset? livestockAsset;
  InterviewCacheModelVehicle? vehicle;
  @JSONField(name: "other_supporting_materials")
  InterviewCacheModelOtherSupportingMaterials? otherSupportingMaterials;
  @JSONField(name: "refuse_loan_info")
  InterviewCacheModelRefuseLoanInfo? refuseLoanInfo;

  InterviewCacheModel();

  factory InterviewCacheModel.fromJson(Map<String, dynamic> json) => $InterviewCacheModelFromJson(json);

  Map<String, dynamic> toJson() => $InterviewCacheModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class InterviewCacheModelSalaryAsset {
  Subcategory? salary;
  @JSONField(name: "monthly_flow")
  Subcategory? monthlyFlow;
  @JSONField(name: "salary_photos")
  List<String>? salaryPhotos;
  @JSONField(name: "monthly_flow_photos")
  List<String>? monthlyFlowPhotos;

  InterviewCacheModelSalaryAsset();

  factory InterviewCacheModelSalaryAsset.fromJson(Map<String, dynamic> json) => $InterviewCacheModelSalaryAssetFromJson(json);

  Map<String, dynamic> toJson() => $InterviewCacheModelSalaryAssetToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class InterviewCacheModelInvestmentInfo {
  @JSONField(name: "investment_type")
  Subcategory? investmentType;
  @JSONField(name: "voucher_validity")
  String? voucherValidity;
  @JSONField(name: "voucher_amount")
  String? voucherAmount;
  List<String>? photos;

  InterviewCacheModelInvestmentInfo();

  factory InterviewCacheModelInvestmentInfo.fromJson(Map<String, dynamic> json) => $InterviewCacheModelInvestmentInfoFromJson(json);

  Map<String, dynamic> toJson() => $InterviewCacheModelInvestmentInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class InterviewCacheModelIncumbencyInfo {
  bool? badge;
  List<String>? photos;

  InterviewCacheModelIncumbencyInfo();

  factory InterviewCacheModelIncumbencyInfo.fromJson(Map<String, dynamic> json) => $InterviewCacheModelIncumbencyInfoFromJson(json);

  Map<String, dynamic> toJson() => $InterviewCacheModelIncumbencyInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class InterviewCacheModelLandAsset {
  @JSONField(name: "hold_status")
  bool? holdStatus;
  String? location;
  @JSONField(name: "location_code")
  String? locationCode;
  @JSONField(name: "full_address")
  String? fullAddress;
  @JSONField(name: "estimated_area")
  String? estimatedArea;
  @JSONField(name: "market_value")
  String? marketValue;
  List<String>? photos;

  InterviewCacheModelLandAsset();

  factory InterviewCacheModelLandAsset.fromJson(Map<String, dynamic> json) => $InterviewCacheModelLandAssetFromJson(json);

  Map<String, dynamic> toJson() => $InterviewCacheModelLandAssetToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class InterviewCacheModelHouseAsset {
  @JSONField(name: "hold_status")
  bool? holdStatus;
  String? location;
  @JSONField(name: "location_code")
  String? locationCode;
  @JSONField(name: "full_address")
  String? fullAddress;
  @JSONField(name: "purchase_time")
  String? purchaseTime;
  @JSONField(name: "purchase_price")
  String? purchasePrice;
  @JSONField(name: "market_value")
  String? marketValue;
  List<String>? photos;

  InterviewCacheModelHouseAsset();

  factory InterviewCacheModelHouseAsset.fromJson(Map<String, dynamic> json) => $InterviewCacheModelHouseAssetFromJson(json);

  Map<String, dynamic> toJson() => $InterviewCacheModelHouseAssetToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class InterviewCacheModelBusinessAsset {
  @JSONField(name: "hold_status")
  bool? holdStatus;
  String? location;
  @JSONField(name: "location_code")
  String? locationCode;
  @JSONField(name: "full_address")
  String? fullAddress;
  @JSONField(name: "purchase_time")
  String? purchaseTime;
  @JSONField(name: "purchase_price")
  String?purchasePrice;
  @JSONField(name: "market_value")
  String? marketValue;
  List<String>? photos;

  InterviewCacheModelBusinessAsset();

  factory InterviewCacheModelBusinessAsset.fromJson(Map<String, dynamic> json) => $InterviewCacheModelBusinessAssetFromJson(json);

  Map<String, dynamic> toJson() => $InterviewCacheModelBusinessAssetToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class InterviewCacheModelLivestockAsset {
  @JSONField(name: "asset_type")
  Subcategory? assetType;
  String? amount;
  @JSONField(name: "estimated_unit_price")
  String? estimatedUnitPrice;
  @JSONField(name: "total_market_value")
  String? totalMarketValue;
  List<String>? photos;

  InterviewCacheModelLivestockAsset();

  factory InterviewCacheModelLivestockAsset.fromJson(Map<String, dynamic> json) => $InterviewCacheModelLivestockAssetFromJson(json);

  Map<String, dynamic> toJson() => $InterviewCacheModelLivestockAssetToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class InterviewCacheModelVehicle {
  @JSONField(name: "vehicle_type")
  Subcategory? vehicleType;
  @JSONField(name: "purchase_price")
  String? purchasePrice;
  @JSONField(name: "purchase_date")
 String? purchaseDate;
  @JSONField(name: "market_value")
  String? marketValue;
  List<String>? photos;

  InterviewCacheModelVehicle();

  factory InterviewCacheModelVehicle.fromJson(Map<String, dynamic> json) => $InterviewCacheModelVehicleFromJson(json);

  Map<String, dynamic> toJson() => $InterviewCacheModelVehicleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class InterviewCacheModelOtherSupportingMaterials {
  String? addition;
  List<String>? photos;

  InterviewCacheModelOtherSupportingMaterials();

  factory InterviewCacheModelOtherSupportingMaterials.fromJson(Map<String, dynamic> json) => $InterviewCacheModelOtherSupportingMaterialsFromJson(json);

  Map<String, dynamic> toJson() => $InterviewCacheModelOtherSupportingMaterialsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class InterviewCacheModelRefuseLoanInfo {
  bool status = false;
  String? recommend;

  InterviewCacheModelRefuseLoanInfo();

  factory InterviewCacheModelRefuseLoanInfo.fromJson(Map<String, dynamic> json) => $InterviewCacheModelRefuseLoanInfoFromJson(json);

  Map<String, dynamic> toJson() => $InterviewCacheModelRefuseLoanInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
