import 'package:investigators/generated/json/base/json_field.dart';
import 'dart:convert';

import '../generated/json/last_interview_info.g.dart';
import 'interview_detail_info.dart';

@JsonSerializable()
class LastInterviewInfo {
  late LastInterviewInfoIdentity identity;
  late LastInterviewInfoSalary salary;
  late LastInterviewInfoAsset asset;
  @JSONField(name: "account_info")
  late List<InterviewDetailInfoInterviewInfoAccount> accountInfo;

  LastInterviewInfo();

  factory LastInterviewInfo.fromJson(Map<String, dynamic> json) => $LastInterviewInfoFromJson(json);

  Map<String, dynamic> toJson() => $LastInterviewInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LastInterviewInfoIdentity {
  @JSONField(name: "name_correct")
  late String nameCorrect;
  @JSONField(name: "client_name")
  late String clientName;
  @JSONField(name: "resident_address_correct")
  late String residentAddressCorrect;
  @JSONField(name: "resident_address")
  late String residentAddress;
  @JSONField(name: "company_address_correct")
  late String companyAddressCorrect;
  @JSONField(name: "company_address")
  late String companyAddress;
  @JSONField(name: "is_personal_correct")
  late String isPersonalCorrect;
  @JSONField(name: "other_info")
  late List<String> otherInfo;

  LastInterviewInfoIdentity();

  factory LastInterviewInfoIdentity.fromJson(Map<String, dynamic> json) => $LastInterviewInfoIdentityFromJson(json);

  Map<String, dynamic> toJson() => $LastInterviewInfoIdentityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LastInterviewInfoSalary {
  @JSONField(name: "monthly_income")
  late String monthlyIncome;
  @JSONField(name: "monthly_income_proof")
  late List<String> monthlyIncomeProof;
  @JSONField(name: "transaction_flow")
  late String transactionFlow;
  @JSONField(name: "transaction_flow_proof")
  late List<String> transactionFlowProof;
  @JSONField(name: "investment_type")
  late String investmentType;
  @JSONField(name: "investment_expired")
  late String investmentExpired;
  @JSONField(name: "investment_amount")
  late String investmentAmount;
  @JSONField(name: "investment_proof")
  late List<String> investmentProof;
  @JSONField(name: "badge_exist")
  late String badgeExist;
  @JSONField(name: "badge_proof")
  late List<String> badgeProof;

  LastInterviewInfoSalary();

  factory LastInterviewInfoSalary.fromJson(Map<String, dynamic> json) => $LastInterviewInfoSalaryFromJson(json);

  Map<String, dynamic> toJson() => $LastInterviewInfoSalaryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LastInterviewInfoAsset {
  @JSONField(name: "land_ownership")
  late String landOwnership;
  @JSONField(name: "land_content")
  late LastInterviewInfoAssetLandContent landContent;
  @JSONField(name: "land_proof")
  late List<String> landProof;
  @JSONField(name: "house_ownership")
  late String houseOwnership;
  @JSONField(name: "house_content")
  late LastInterviewInfoAssetHouseContent houseContent;
  @JSONField(name: "house_proof")
  late List<String> houseProof;
  @JSONField(name: "shop_assets")
  late String shopAssets;
  @JSONField(name: "shop_content")
  late LastInterviewInfoAssetShopContent shopContent;
  @JSONField(name: "shop_proof")
  late List<String> shopProof;
  @JSONField(name: "livestock_assets")
  late String livestockAssets;
  @JSONField(name: "livestock_cate")
  late String livestockCate;
  @JSONField(name: "livestock_content")
  late LastInterviewInfoAssetLivestockContent livestockContent;
  @JSONField(name: "livestock_proof")
  late List<String> livestockProof;
  late String vehicle;
  @JSONField(name: "vehicle_cate")
  late String vehicleCate;
  @JSONField(name: "vehicle_content")
  late LastInterviewInfoAssetVehicleContent vehicleContent;
  @JSONField(name: "vehicle_proof")
  late List<String> vehicleProof;
  @JSONField(name: "other_assets")
  late String otherAssets;
  @JSONField(name: "other_assets_content")
  late String otherAssetsContent;
  @JSONField(name: "other_assets_proof")
  late List<String> otherAssetsProof;

  LastInterviewInfoAsset();

  factory LastInterviewInfoAsset.fromJson(Map<String, dynamic> json) => $LastInterviewInfoAssetFromJson(json);

  Map<String, dynamic> toJson() => $LastInterviewInfoAssetToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LastInterviewInfoAssetLandContent {
  @JSONField(name: "address_code")
  late String addressCode;
  @JSONField(name: "detail_address")
  late String detailAddress;
  late String area;
  @JSONField(name: "estimated_value")
  late String estimatedValue;
  @JSONField(name: "address_text")
  late String addressText;

  LastInterviewInfoAssetLandContent();

  factory LastInterviewInfoAssetLandContent.fromJson(Map<String, dynamic> json) => $LastInterviewInfoAssetLandContentFromJson(json);

  Map<String, dynamic> toJson() => $LastInterviewInfoAssetLandContentToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LastInterviewInfoAssetHouseContent {
  @JSONField(name: "address_code")
  late String addressCode;
  @JSONField(name: "detail_address")
  late String detailAddress;
  @JSONField(name: "purchase_time")
  late String purchaseTime;
  @JSONField(name: "purchase_price")
  late String purchasePrice;
  @JSONField(name: "estimated_value")
  late String estimatedValue;
  @JSONField(name: "address_text")
  late String addressText;

  LastInterviewInfoAssetHouseContent();

  factory LastInterviewInfoAssetHouseContent.fromJson(Map<String, dynamic> json) => $LastInterviewInfoAssetHouseContentFromJson(json);

  Map<String, dynamic> toJson() => $LastInterviewInfoAssetHouseContentToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LastInterviewInfoAssetShopContent {
  @JSONField(name: "address_code")
  late String addressCode;
  @JSONField(name: "detail_address")
  late String detailAddress;
  @JSONField(name: "purchase_time")
  late String purchaseTime;
  @JSONField(name: "purchase_price")
  late String purchasePrice;
  @JSONField(name: "estimated_value")
  late String estimatedValue;
  @JSONField(name: "address_text")
  late String addressText;

  LastInterviewInfoAssetShopContent();

  factory LastInterviewInfoAssetShopContent.fromJson(Map<String, dynamic> json) => $LastInterviewInfoAssetShopContentFromJson(json);

  Map<String, dynamic> toJson() => $LastInterviewInfoAssetShopContentToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LastInterviewInfoAssetLivestockContent {
  late String number;
  @JSONField(name: "estimated_value_per")
  late String estimatedValuePer;
  @JSONField(name: "estimated_value_total")
  late String estimatedValueTotal;

  LastInterviewInfoAssetLivestockContent();

  factory LastInterviewInfoAssetLivestockContent.fromJson(Map<String, dynamic> json) => $LastInterviewInfoAssetLivestockContentFromJson(json);

  Map<String, dynamic> toJson() => $LastInterviewInfoAssetLivestockContentToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LastInterviewInfoAssetVehicleContent {
  @JSONField(name: "purchase_price")
  late String purchasePrice;
  @JSONField(name: "purchase_time")
  late String purchaseTime;
  @JSONField(name: "estimated_value")
  late String estimatedValue;

  LastInterviewInfoAssetVehicleContent();

  factory LastInterviewInfoAssetVehicleContent.fromJson(Map<String, dynamic> json) => $LastInterviewInfoAssetVehicleContentFromJson(json);

  Map<String, dynamic> toJson() => $LastInterviewInfoAssetVehicleContentToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
