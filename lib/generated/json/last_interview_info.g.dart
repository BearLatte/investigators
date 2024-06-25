import 'package:investigators/generated/json/base/json_convert_content.dart';
import 'package:investigators/models/last_interview_info.dart';
import '../../models/interview_detail_info.dart';


LastInterviewInfo $LastInterviewInfoFromJson(Map<String, dynamic> json) {
  final LastInterviewInfo lastInterviewInfo = LastInterviewInfo();
  final LastInterviewInfoIdentity? identity = jsonConvert.convert<LastInterviewInfoIdentity>(json['identity']);
  if (identity != null) {
    lastInterviewInfo.identity = identity;
  }
  final LastInterviewInfoSalary? salary = jsonConvert.convert<LastInterviewInfoSalary>(json['salary']);
  if (salary != null) {
    lastInterviewInfo.salary = salary;
  }
  final LastInterviewInfoAsset? asset = jsonConvert.convert<LastInterviewInfoAsset>(json['asset']);
  if (asset != null) {
    lastInterviewInfo.asset = asset;
  }
  final List<InterviewDetailInfoInterviewInfoAccount>? accountInfo = (json['account_info'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<InterviewDetailInfoInterviewInfoAccount>(e) as InterviewDetailInfoInterviewInfoAccount).toList();
  if (accountInfo != null) {
    lastInterviewInfo.accountInfo = accountInfo;
  }
  return lastInterviewInfo;
}

Map<String, dynamic> $LastInterviewInfoToJson(LastInterviewInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['identity'] = entity.identity.toJson();
  data['salary'] = entity.salary.toJson();
  data['asset'] = entity.asset.toJson();
  data['account_info'] = entity.accountInfo.map((v) => v.toJson()).toList();
  return data;
}

extension LastInterviewInfoExtension on LastInterviewInfo {
  LastInterviewInfo copyWith({
    LastInterviewInfoIdentity? identity,
    LastInterviewInfoSalary? salary,
    LastInterviewInfoAsset? asset,
    List<InterviewDetailInfoInterviewInfoAccount>? accountInfo,
  }) {
    return LastInterviewInfo()
      ..identity = identity ?? this.identity
      ..salary = salary ?? this.salary
      ..asset = asset ?? this.asset
      ..accountInfo = accountInfo ?? this.accountInfo;
  }
}

LastInterviewInfoIdentity $LastInterviewInfoIdentityFromJson(Map<String, dynamic> json) {
  final LastInterviewInfoIdentity lastInterviewInfoIdentity = LastInterviewInfoIdentity();
  final String? nameCorrect = jsonConvert.convert<String>(json['name_correct']);
  if (nameCorrect != null) {
    lastInterviewInfoIdentity.nameCorrect = nameCorrect;
  }
  final String? clientName = jsonConvert.convert<String>(json['client_name']);
  if (clientName != null) {
    lastInterviewInfoIdentity.clientName = clientName;
  }
  final String? residentAddressCorrect = jsonConvert.convert<String>(json['resident_address_correct']);
  if (residentAddressCorrect != null) {
    lastInterviewInfoIdentity.residentAddressCorrect = residentAddressCorrect;
  }
  final String? residentAddress = jsonConvert.convert<String>(json['resident_address']);
  if (residentAddress != null) {
    lastInterviewInfoIdentity.residentAddress = residentAddress;
  }
  final String? companyAddressCorrect = jsonConvert.convert<String>(json['company_address_correct']);
  if (companyAddressCorrect != null) {
    lastInterviewInfoIdentity.companyAddressCorrect = companyAddressCorrect;
  }
  final String? companyAddress = jsonConvert.convert<String>(json['company_address']);
  if (companyAddress != null) {
    lastInterviewInfoIdentity.companyAddress = companyAddress;
  }
  final String? isPersonalCorrect = jsonConvert.convert<String>(json['is_personal_correct']);
  if (isPersonalCorrect != null) {
    lastInterviewInfoIdentity.isPersonalCorrect = isPersonalCorrect;
  }
  final List<String>? otherInfo = (json['other_info'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (otherInfo != null) {
    lastInterviewInfoIdentity.otherInfo = otherInfo;
  }
  return lastInterviewInfoIdentity;
}

Map<String, dynamic> $LastInterviewInfoIdentityToJson(LastInterviewInfoIdentity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name_correct'] = entity.nameCorrect;
  data['client_name'] = entity.clientName;
  data['resident_address_correct'] = entity.residentAddressCorrect;
  data['resident_address'] = entity.residentAddress;
  data['company_address_correct'] = entity.companyAddressCorrect;
  data['company_address'] = entity.companyAddress;
  data['is_personal_correct'] = entity.isPersonalCorrect;
  data['other_info'] = entity.otherInfo;
  return data;
}

extension LastInterviewInfoIdentityExtension on LastInterviewInfoIdentity {
  LastInterviewInfoIdentity copyWith({
    String? nameCorrect,
    String? clientName,
    String? residentAddressCorrect,
    String? residentAddress,
    String? companyAddressCorrect,
    String? companyAddress,
    String? isPersonalCorrect,
    List<String>? otherInfo,
  }) {
    return LastInterviewInfoIdentity()
      ..nameCorrect = nameCorrect ?? this.nameCorrect
      ..clientName = clientName ?? this.clientName
      ..residentAddressCorrect = residentAddressCorrect ?? this.residentAddressCorrect
      ..residentAddress = residentAddress ?? this.residentAddress
      ..companyAddressCorrect = companyAddressCorrect ?? this.companyAddressCorrect
      ..companyAddress = companyAddress ?? this.companyAddress
      ..isPersonalCorrect = isPersonalCorrect ?? this.isPersonalCorrect
      ..otherInfo = otherInfo ?? this.otherInfo;
  }
}

LastInterviewInfoSalary $LastInterviewInfoSalaryFromJson(Map<String, dynamic> json) {
  final LastInterviewInfoSalary lastInterviewInfoSalary = LastInterviewInfoSalary();
  final String? monthlyIncome = jsonConvert.convert<String>(json['monthly_income']);
  if (monthlyIncome != null) {
    lastInterviewInfoSalary.monthlyIncome = monthlyIncome;
  }
  final List<String>? monthlyIncomeProof = (json['monthly_income_proof'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (monthlyIncomeProof != null) {
    lastInterviewInfoSalary.monthlyIncomeProof = monthlyIncomeProof;
  }
  final String? transactionFlow = jsonConvert.convert<String>(json['transaction_flow']);
  if (transactionFlow != null) {
    lastInterviewInfoSalary.transactionFlow = transactionFlow;
  }
  final List<String>? transactionFlowProof = (json['transaction_flow_proof'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (transactionFlowProof != null) {
    lastInterviewInfoSalary.transactionFlowProof = transactionFlowProof;
  }
  final String? investmentType = jsonConvert.convert<String>(json['investment_type']);
  if (investmentType != null) {
    lastInterviewInfoSalary.investmentType = investmentType;
  }
  final String? investmentExpired = jsonConvert.convert<String>(json['investment_expired']);
  if (investmentExpired != null) {
    lastInterviewInfoSalary.investmentExpired = investmentExpired;
  }
  final String? investmentAmount = jsonConvert.convert<String>(json['investment_amount']);
  if (investmentAmount != null) {
    lastInterviewInfoSalary.investmentAmount = investmentAmount;
  }
  final List<String>? investmentProof = (json['investment_proof'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (investmentProof != null) {
    lastInterviewInfoSalary.investmentProof = investmentProof;
  }
  final String? badgeExist = jsonConvert.convert<String>(json['badge_exist']);
  if (badgeExist != null) {
    lastInterviewInfoSalary.badgeExist = badgeExist;
  }
  final List<String>? badgeProof = (json['badge_proof'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (badgeProof != null) {
    lastInterviewInfoSalary.badgeProof = badgeProof;
  }
  return lastInterviewInfoSalary;
}

Map<String, dynamic> $LastInterviewInfoSalaryToJson(LastInterviewInfoSalary entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['monthly_income'] = entity.monthlyIncome;
  data['monthly_income_proof'] = entity.monthlyIncomeProof;
  data['transaction_flow'] = entity.transactionFlow;
  data['transaction_flow_proof'] = entity.transactionFlowProof;
  data['investment_type'] = entity.investmentType;
  data['investment_expired'] = entity.investmentExpired;
  data['investment_amount'] = entity.investmentAmount;
  data['investment_proof'] = entity.investmentProof;
  data['badge_exist'] = entity.badgeExist;
  data['badge_proof'] = entity.badgeProof;
  return data;
}

extension LastInterviewInfoSalaryExtension on LastInterviewInfoSalary {
  LastInterviewInfoSalary copyWith({
    String? monthlyIncome,
    List<String>? monthlyIncomeProof,
    String? transactionFlow,
    List<String>? transactionFlowProof,
    String? investmentType,
    String? investmentExpired,
    String? investmentAmount,
    List<String>? investmentProof,
    String? badgeExist,
    List<String>? badgeProof,
  }) {
    return LastInterviewInfoSalary()
      ..monthlyIncome = monthlyIncome ?? this.monthlyIncome
      ..monthlyIncomeProof = monthlyIncomeProof ?? this.monthlyIncomeProof
      ..transactionFlow = transactionFlow ?? this.transactionFlow
      ..transactionFlowProof = transactionFlowProof ?? this.transactionFlowProof
      ..investmentType = investmentType ?? this.investmentType
      ..investmentExpired = investmentExpired ?? this.investmentExpired
      ..investmentAmount = investmentAmount ?? this.investmentAmount
      ..investmentProof = investmentProof ?? this.investmentProof
      ..badgeExist = badgeExist ?? this.badgeExist
      ..badgeProof = badgeProof ?? this.badgeProof;
  }
}

LastInterviewInfoAsset $LastInterviewInfoAssetFromJson(Map<String, dynamic> json) {
  final LastInterviewInfoAsset lastInterviewInfoAsset = LastInterviewInfoAsset();
  final String? landOwnership = jsonConvert.convert<String>(json['land_ownership']);
  if (landOwnership != null) {
    lastInterviewInfoAsset.landOwnership = landOwnership;
  }
  final LastInterviewInfoAssetLandContent? landContent = jsonConvert.convert<LastInterviewInfoAssetLandContent>(json['land_content']);
  if (landContent != null) {
    lastInterviewInfoAsset.landContent = landContent;
  }
  final List<String>? landProof = (json['land_proof'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (landProof != null) {
    lastInterviewInfoAsset.landProof = landProof;
  }
  final String? houseOwnership = jsonConvert.convert<String>(json['house_ownership']);
  if (houseOwnership != null) {
    lastInterviewInfoAsset.houseOwnership = houseOwnership;
  }
  final LastInterviewInfoAssetHouseContent? houseContent = jsonConvert.convert<LastInterviewInfoAssetHouseContent>(json['house_content']);
  if (houseContent != null) {
    lastInterviewInfoAsset.houseContent = houseContent;
  }
  final List<String>? houseProof = (json['house_proof'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (houseProof != null) {
    lastInterviewInfoAsset.houseProof = houseProof;
  }
  final String? shopAssets = jsonConvert.convert<String>(json['shop_assets']);
  if (shopAssets != null) {
    lastInterviewInfoAsset.shopAssets = shopAssets;
  }
  final LastInterviewInfoAssetShopContent? shopContent = jsonConvert.convert<LastInterviewInfoAssetShopContent>(json['shop_content']);
  if (shopContent != null) {
    lastInterviewInfoAsset.shopContent = shopContent;
  }
  final List<String>? shopProof = (json['shop_proof'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (shopProof != null) {
    lastInterviewInfoAsset.shopProof = shopProof;
  }
  final String? livestockAssets = jsonConvert.convert<String>(json['livestock_assets']);
  if (livestockAssets != null) {
    lastInterviewInfoAsset.livestockAssets = livestockAssets;
  }
  final String? livestockCate = jsonConvert.convert<String>(json['livestock_cate']);
  if (livestockCate != null) {
    lastInterviewInfoAsset.livestockCate = livestockCate;
  }
  final LastInterviewInfoAssetLivestockContent? livestockContent = jsonConvert.convert<LastInterviewInfoAssetLivestockContent>(json['livestock_content']);
  if (livestockContent != null) {
    lastInterviewInfoAsset.livestockContent = livestockContent;
  }
  final List<String>? livestockProof = (json['livestock_proof'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (livestockProof != null) {
    lastInterviewInfoAsset.livestockProof = livestockProof;
  }
  final String? vehicle = jsonConvert.convert<String>(json['vehicle']);
  if (vehicle != null) {
    lastInterviewInfoAsset.vehicle = vehicle;
  }
  final String? vehicleCate = jsonConvert.convert<String>(json['vehicle_cate']);
  if (vehicleCate != null) {
    lastInterviewInfoAsset.vehicleCate = vehicleCate;
  }
  final LastInterviewInfoAssetVehicleContent? vehicleContent = jsonConvert.convert<LastInterviewInfoAssetVehicleContent>(json['vehicle_content']);
  if (vehicleContent != null) {
    lastInterviewInfoAsset.vehicleContent = vehicleContent;
  }
  final List<String>? vehicleProof = (json['vehicle_proof'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (vehicleProof != null) {
    lastInterviewInfoAsset.vehicleProof = vehicleProof;
  }
  final String? otherAssets = jsonConvert.convert<String>(json['other_assets']);
  if (otherAssets != null) {
    lastInterviewInfoAsset.otherAssets = otherAssets;
  }
  final String? otherAssetsContent = jsonConvert.convert<String>(json['other_assets_content']);
  if (otherAssetsContent != null) {
    lastInterviewInfoAsset.otherAssetsContent = otherAssetsContent;
  }
  final List<String>? otherAssetsProof = (json['other_assets_proof'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (otherAssetsProof != null) {
    lastInterviewInfoAsset.otherAssetsProof = otherAssetsProof;
  }
  return lastInterviewInfoAsset;
}

Map<String, dynamic> $LastInterviewInfoAssetToJson(LastInterviewInfoAsset entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['land_ownership'] = entity.landOwnership;
  data['land_content'] = entity.landContent.toJson();
  data['land_proof'] = entity.landProof;
  data['house_ownership'] = entity.houseOwnership;
  data['house_content'] = entity.houseContent.toJson();
  data['house_proof'] = entity.houseProof;
  data['shop_assets'] = entity.shopAssets;
  data['shop_content'] = entity.shopContent.toJson();
  data['shop_proof'] = entity.shopProof;
  data['livestock_assets'] = entity.livestockAssets;
  data['livestock_cate'] = entity.livestockCate;
  data['livestock_content'] = entity.livestockContent.toJson();
  data['livestock_proof'] = entity.livestockProof;
  data['vehicle'] = entity.vehicle;
  data['vehicle_cate'] = entity.vehicleCate;
  data['vehicle_content'] = entity.vehicleContent.toJson();
  data['vehicle_proof'] = entity.vehicleProof;
  data['other_assets'] = entity.otherAssets;
  data['other_assets_content'] = entity.otherAssetsContent;
  data['other_assets_proof'] = entity.otherAssetsProof;
  return data;
}

extension LastInterviewInfoAssetExtension on LastInterviewInfoAsset {
  LastInterviewInfoAsset copyWith({
    String? landOwnership,
    LastInterviewInfoAssetLandContent? landContent,
    List<String>? landProof,
    String? houseOwnership,
    LastInterviewInfoAssetHouseContent? houseContent,
    List<String>? houseProof,
    String? shopAssets,
    LastInterviewInfoAssetShopContent? shopContent,
    List<String>? shopProof,
    String? livestockAssets,
    String? livestockCate,
    LastInterviewInfoAssetLivestockContent? livestockContent,
    List<String>? livestockProof,
    String? vehicle,
    String? vehicleCate,
    LastInterviewInfoAssetVehicleContent? vehicleContent,
    List<String>? vehicleProof,
    String? otherAssets,
    String? otherAssetsContent,
    List<String>? otherAssetsProof,
  }) {
    return LastInterviewInfoAsset()
      ..landOwnership = landOwnership ?? this.landOwnership
      ..landContent = landContent ?? this.landContent
      ..landProof = landProof ?? this.landProof
      ..houseOwnership = houseOwnership ?? this.houseOwnership
      ..houseContent = houseContent ?? this.houseContent
      ..houseProof = houseProof ?? this.houseProof
      ..shopAssets = shopAssets ?? this.shopAssets
      ..shopContent = shopContent ?? this.shopContent
      ..shopProof = shopProof ?? this.shopProof
      ..livestockAssets = livestockAssets ?? this.livestockAssets
      ..livestockCate = livestockCate ?? this.livestockCate
      ..livestockContent = livestockContent ?? this.livestockContent
      ..livestockProof = livestockProof ?? this.livestockProof
      ..vehicle = vehicle ?? this.vehicle
      ..vehicleCate = vehicleCate ?? this.vehicleCate
      ..vehicleContent = vehicleContent ?? this.vehicleContent
      ..vehicleProof = vehicleProof ?? this.vehicleProof
      ..otherAssets = otherAssets ?? this.otherAssets
      ..otherAssetsContent = otherAssetsContent ?? this.otherAssetsContent
      ..otherAssetsProof = otherAssetsProof ?? this.otherAssetsProof;
  }
}

LastInterviewInfoAssetLandContent $LastInterviewInfoAssetLandContentFromJson(Map<String, dynamic> json) {
  final LastInterviewInfoAssetLandContent lastInterviewInfoAssetLandContent = LastInterviewInfoAssetLandContent();
  final String? addressCode = jsonConvert.convert<String>(json['address_code']);
  if (addressCode != null) {
    lastInterviewInfoAssetLandContent.addressCode = addressCode;
  }
  final String? detailAddress = jsonConvert.convert<String>(json['detail_address']);
  if (detailAddress != null) {
    lastInterviewInfoAssetLandContent.detailAddress = detailAddress;
  }
  final String? area = jsonConvert.convert<String>(json['area']);
  if (area != null) {
    lastInterviewInfoAssetLandContent.area = area;
  }
  final String? estimatedValue = jsonConvert.convert<String>(json['estimated_value']);
  if (estimatedValue != null) {
    lastInterviewInfoAssetLandContent.estimatedValue = estimatedValue;
  }
  final String? addressText = jsonConvert.convert<String>(json['address_text']);
  if (addressText != null) {
    lastInterviewInfoAssetLandContent.addressText = addressText;
  }
  return lastInterviewInfoAssetLandContent;
}

Map<String, dynamic> $LastInterviewInfoAssetLandContentToJson(LastInterviewInfoAssetLandContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['address_code'] = entity.addressCode;
  data['detail_address'] = entity.detailAddress;
  data['area'] = entity.area;
  data['estimated_value'] = entity.estimatedValue;
  data['address_text'] = entity.addressText;
  return data;
}

extension LastInterviewInfoAssetLandContentExtension on LastInterviewInfoAssetLandContent {
  LastInterviewInfoAssetLandContent copyWith({
    String? addressCode,
    String? detailAddress,
    String? area,
    String? estimatedValue,
    String? addressText,
  }) {
    return LastInterviewInfoAssetLandContent()
      ..addressCode = addressCode ?? this.addressCode
      ..detailAddress = detailAddress ?? this.detailAddress
      ..area = area ?? this.area
      ..estimatedValue = estimatedValue ?? this.estimatedValue
      ..addressText = addressText ?? this.addressText;
  }
}

LastInterviewInfoAssetHouseContent $LastInterviewInfoAssetHouseContentFromJson(Map<String, dynamic> json) {
  final LastInterviewInfoAssetHouseContent lastInterviewInfoAssetHouseContent = LastInterviewInfoAssetHouseContent();
  final String? addressCode = jsonConvert.convert<String>(json['address_code']);
  if (addressCode != null) {
    lastInterviewInfoAssetHouseContent.addressCode = addressCode;
  }
  final String? detailAddress = jsonConvert.convert<String>(json['detail_address']);
  if (detailAddress != null) {
    lastInterviewInfoAssetHouseContent.detailAddress = detailAddress;
  }
  final String? purchaseTime = jsonConvert.convert<String>(json['purchase_time']);
  if (purchaseTime != null) {
    lastInterviewInfoAssetHouseContent.purchaseTime = purchaseTime;
  }
  final String? purchasePrice = jsonConvert.convert<String>(json['purchase_price']);
  if (purchasePrice != null) {
    lastInterviewInfoAssetHouseContent.purchasePrice = purchasePrice;
  }
  final String? estimatedValue = jsonConvert.convert<String>(json['estimated_value']);
  if (estimatedValue != null) {
    lastInterviewInfoAssetHouseContent.estimatedValue = estimatedValue;
  }
  final String? addressText = jsonConvert.convert<String>(json['address_text']);
  if (addressText != null) {
    lastInterviewInfoAssetHouseContent.addressText = addressText;
  }
  return lastInterviewInfoAssetHouseContent;
}

Map<String, dynamic> $LastInterviewInfoAssetHouseContentToJson(LastInterviewInfoAssetHouseContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['address_code'] = entity.addressCode;
  data['detail_address'] = entity.detailAddress;
  data['purchase_time'] = entity.purchaseTime;
  data['purchase_price'] = entity.purchasePrice;
  data['estimated_value'] = entity.estimatedValue;
  data['address_text'] = entity.addressText;
  return data;
}

extension LastInterviewInfoAssetHouseContentExtension on LastInterviewInfoAssetHouseContent {
  LastInterviewInfoAssetHouseContent copyWith({
    String? addressCode,
    String? detailAddress,
    String? purchaseTime,
    String? purchasePrice,
    String? estimatedValue,
    String? addressText,
  }) {
    return LastInterviewInfoAssetHouseContent()
      ..addressCode = addressCode ?? this.addressCode
      ..detailAddress = detailAddress ?? this.detailAddress
      ..purchaseTime = purchaseTime ?? this.purchaseTime
      ..purchasePrice = purchasePrice ?? this.purchasePrice
      ..estimatedValue = estimatedValue ?? this.estimatedValue
      ..addressText = addressText ?? this.addressText;
  }
}

LastInterviewInfoAssetShopContent $LastInterviewInfoAssetShopContentFromJson(Map<String, dynamic> json) {
  final LastInterviewInfoAssetShopContent lastInterviewInfoAssetShopContent = LastInterviewInfoAssetShopContent();
  final String? addressCode = jsonConvert.convert<String>(json['address_code']);
  if (addressCode != null) {
    lastInterviewInfoAssetShopContent.addressCode = addressCode;
  }
  final String? detailAddress = jsonConvert.convert<String>(json['detail_address']);
  if (detailAddress != null) {
    lastInterviewInfoAssetShopContent.detailAddress = detailAddress;
  }
  final String? purchaseTime = jsonConvert.convert<String>(json['purchase_time']);
  if (purchaseTime != null) {
    lastInterviewInfoAssetShopContent.purchaseTime = purchaseTime;
  }
  final String? purchasePrice = jsonConvert.convert<String>(json['purchase_price']);
  if (purchasePrice != null) {
    lastInterviewInfoAssetShopContent.purchasePrice = purchasePrice;
  }
  final String? estimatedValue = jsonConvert.convert<String>(json['estimated_value']);
  if (estimatedValue != null) {
    lastInterviewInfoAssetShopContent.estimatedValue = estimatedValue;
  }
  final String? addressText = jsonConvert.convert<String>(json['address_text']);
  if (addressText != null) {
    lastInterviewInfoAssetShopContent.addressText = addressText;
  }
  return lastInterviewInfoAssetShopContent;
}

Map<String, dynamic> $LastInterviewInfoAssetShopContentToJson(LastInterviewInfoAssetShopContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['address_code'] = entity.addressCode;
  data['detail_address'] = entity.detailAddress;
  data['purchase_time'] = entity.purchaseTime;
  data['purchase_price'] = entity.purchasePrice;
  data['estimated_value'] = entity.estimatedValue;
  data['address_text'] = entity.addressText;
  return data;
}

extension LastInterviewInfoAssetShopContentExtension on LastInterviewInfoAssetShopContent {
  LastInterviewInfoAssetShopContent copyWith({
    String? addressCode,
    String? detailAddress,
    String? purchaseTime,
    String? purchasePrice,
    String? estimatedValue,
    String? addressText,
  }) {
    return LastInterviewInfoAssetShopContent()
      ..addressCode = addressCode ?? this.addressCode
      ..detailAddress = detailAddress ?? this.detailAddress
      ..purchaseTime = purchaseTime ?? this.purchaseTime
      ..purchasePrice = purchasePrice ?? this.purchasePrice
      ..estimatedValue = estimatedValue ?? this.estimatedValue
      ..addressText = addressText ?? this.addressText;
  }
}

LastInterviewInfoAssetLivestockContent $LastInterviewInfoAssetLivestockContentFromJson(Map<String, dynamic> json) {
  final LastInterviewInfoAssetLivestockContent lastInterviewInfoAssetLivestockContent = LastInterviewInfoAssetLivestockContent();
  final String? number = jsonConvert.convert<String>(json['number']);
  if (number != null) {
    lastInterviewInfoAssetLivestockContent.number = number;
  }
  final String? estimatedValuePer = jsonConvert.convert<String>(json['estimated_value_per']);
  if (estimatedValuePer != null) {
    lastInterviewInfoAssetLivestockContent.estimatedValuePer = estimatedValuePer;
  }
  final String? estimatedValueTotal = jsonConvert.convert<String>(json['estimated_value_total']);
  if (estimatedValueTotal != null) {
    lastInterviewInfoAssetLivestockContent.estimatedValueTotal = estimatedValueTotal;
  }
  return lastInterviewInfoAssetLivestockContent;
}

Map<String, dynamic> $LastInterviewInfoAssetLivestockContentToJson(LastInterviewInfoAssetLivestockContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['number'] = entity.number;
  data['estimated_value_per'] = entity.estimatedValuePer;
  data['estimated_value_total'] = entity.estimatedValueTotal;
  return data;
}

extension LastInterviewInfoAssetLivestockContentExtension on LastInterviewInfoAssetLivestockContent {
  LastInterviewInfoAssetLivestockContent copyWith({
    String? number,
    String? estimatedValuePer,
    String? estimatedValueTotal,
  }) {
    return LastInterviewInfoAssetLivestockContent()
      ..number = number ?? this.number
      ..estimatedValuePer = estimatedValuePer ?? this.estimatedValuePer
      ..estimatedValueTotal = estimatedValueTotal ?? this.estimatedValueTotal;
  }
}

LastInterviewInfoAssetVehicleContent $LastInterviewInfoAssetVehicleContentFromJson(Map<String, dynamic> json) {
  final LastInterviewInfoAssetVehicleContent lastInterviewInfoAssetVehicleContent = LastInterviewInfoAssetVehicleContent();
  final String? purchasePrice = jsonConvert.convert<String>(json['purchase_price']);
  if (purchasePrice != null) {
    lastInterviewInfoAssetVehicleContent.purchasePrice = purchasePrice;
  }
  final String? purchaseTime = jsonConvert.convert<String>(json['purchase_time']);
  if (purchaseTime != null) {
    lastInterviewInfoAssetVehicleContent.purchaseTime = purchaseTime;
  }
  final String? estimatedValue = jsonConvert.convert<String>(json['estimated_value']);
  if (estimatedValue != null) {
    lastInterviewInfoAssetVehicleContent.estimatedValue = estimatedValue;
  }
  return lastInterviewInfoAssetVehicleContent;
}

Map<String, dynamic> $LastInterviewInfoAssetVehicleContentToJson(LastInterviewInfoAssetVehicleContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['purchase_price'] = entity.purchasePrice;
  data['purchase_time'] = entity.purchaseTime;
  data['estimated_value'] = entity.estimatedValue;
  return data;
}

extension LastInterviewInfoAssetVehicleContentExtension on LastInterviewInfoAssetVehicleContent {
  LastInterviewInfoAssetVehicleContent copyWith({
    String? purchasePrice,
    String? purchaseTime,
    String? estimatedValue,
  }) {
    return LastInterviewInfoAssetVehicleContent()
      ..purchasePrice = purchasePrice ?? this.purchasePrice
      ..purchaseTime = purchaseTime ?? this.purchaseTime
      ..estimatedValue = estimatedValue ?? this.estimatedValue;
  }
}