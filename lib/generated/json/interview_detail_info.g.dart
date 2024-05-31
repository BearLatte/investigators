import 'package:investigators/generated/json/base/json_convert_content.dart';
import 'package:investigators/models/interview_detail_info.dart';

InterviewDetailInfo $InterviewDetailInfoFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfo interviewDetailInfo = InterviewDetailInfo();
  final InterviewDetailInfoInterviewInfo? interviewInfo = jsonConvert.convert<InterviewDetailInfoInterviewInfo>(json['interview_info']);
  if (interviewInfo != null) {
    interviewDetailInfo.interviewInfo = interviewInfo;
  }
  final InterviewDetailInfoClientInfo? clientInfo = jsonConvert.convert<InterviewDetailInfoClientInfo>(json['client_info']);
  if (clientInfo != null) {
    interviewDetailInfo.clientInfo = clientInfo;
  }
  return interviewDetailInfo;
}

Map<String, dynamic> $InterviewDetailInfoToJson(InterviewDetailInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['interview_info'] = entity.interviewInfo.toJson();
  data['client_info'] = entity.clientInfo.toJson();
  return data;
}

extension InterviewDetailInfoExtension on InterviewDetailInfo {
  InterviewDetailInfo copyWith({
    InterviewDetailInfoInterviewInfo? interviewInfo,
    InterviewDetailInfoClientInfo? clientInfo,
  }) {
    return InterviewDetailInfo()
      ..interviewInfo = interviewInfo ?? this.interviewInfo
      ..clientInfo = clientInfo ?? this.clientInfo;
  }
}

InterviewDetailInfoInterviewInfo $InterviewDetailInfoInterviewInfoFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfo interviewDetailInfoInterviewInfo = InterviewDetailInfoInterviewInfo();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    interviewDetailInfoInterviewInfo.name = name;
  }
  final List<InterviewDetailInfoInterviewInfoAddress>? address = (json['address'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<InterviewDetailInfoInterviewInfoAddress>(e) as InterviewDetailInfoInterviewInfoAddress).toList();
  if (address != null) {
    interviewDetailInfoInterviewInfo.address = address;
  }
  final InterviewDetailInfoInterviewInfoAsset? asset = jsonConvert.convert<InterviewDetailInfoInterviewInfoAsset>(json['asset']);
  if (asset != null) {
    interviewDetailInfoInterviewInfo.asset = asset;
  }
  final List<InterviewDetailInfoInterviewInfoAccount>? account = (json['account'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<InterviewDetailInfoInterviewInfoAccount>(e) as InterviewDetailInfoInterviewInfoAccount).toList();
  if (account != null) {
    interviewDetailInfoInterviewInfo.account = account;
  }
  return interviewDetailInfoInterviewInfo;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoToJson(InterviewDetailInfoInterviewInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['address'] = entity.address.map((v) => v.toJson()).toList();
  data['asset'] = entity.asset.toJson();
  data['account'] = entity.account?.map((v) => v.toJson()).toList();
  return data;
}

extension InterviewDetailInfoInterviewInfoExtension on InterviewDetailInfoInterviewInfo {
  InterviewDetailInfoInterviewInfo copyWith({
    String? name,
    List<InterviewDetailInfoInterviewInfoAddress>? address,
    InterviewDetailInfoInterviewInfoAsset? asset,
    List<InterviewDetailInfoInterviewInfoAccount>? account,
  }) {
    return InterviewDetailInfoInterviewInfo()
      ..name = name ?? this.name
      ..address = address ?? this.address
      ..asset = asset ?? this.asset
      ..account = account ?? this.account;
  }
}

InterviewDetailInfoInterviewInfoAddress $InterviewDetailInfoInterviewInfoAddressFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfoAddress interviewDetailInfoInterviewInfoAddress = InterviewDetailInfoInterviewInfoAddress();
  final String? provinceCode = jsonConvert.convert<String>(json['province_code']);
  if (provinceCode != null) {
    interviewDetailInfoInterviewInfoAddress.provinceCode = provinceCode;
  }
  final String? cityCode = jsonConvert.convert<String>(json['city_code']);
  if (cityCode != null) {
    interviewDetailInfoInterviewInfoAddress.cityCode = cityCode;
  }
  final String? barangayCode = jsonConvert.convert<String>(json['barangay_code']);
  if (barangayCode != null) {
    interviewDetailInfoInterviewInfoAddress.barangayCode = barangayCode;
  }
  final String? fullAddress = jsonConvert.convert<String>(json['full_address']);
  if (fullAddress != null) {
    interviewDetailInfoInterviewInfoAddress.fullAddress = fullAddress;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    interviewDetailInfoInterviewInfoAddress.type = type;
  }
  return interviewDetailInfoInterviewInfoAddress;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoAddressToJson(InterviewDetailInfoInterviewInfoAddress entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['province_code'] = entity.provinceCode;
  data['city_code'] = entity.cityCode;
  data['barangay_code'] = entity.barangayCode;
  data['full_address'] = entity.fullAddress;
  data['type'] = entity.type;
  return data;
}

extension InterviewDetailInfoInterviewInfoAddressExtension on InterviewDetailInfoInterviewInfoAddress {
  InterviewDetailInfoInterviewInfoAddress copyWith({
    String? provinceCode,
    String? cityCode,
    String? barangayCode,
    String? fullAddress,
    String? type,
  }) {
    return InterviewDetailInfoInterviewInfoAddress()
      ..provinceCode = provinceCode ?? this.provinceCode
      ..cityCode = cityCode ?? this.cityCode
      ..barangayCode = barangayCode ?? this.barangayCode
      ..fullAddress = fullAddress ?? this.fullAddress
      ..type = type ?? this.type;
  }
}

InterviewDetailInfoInterviewInfoAsset $InterviewDetailInfoInterviewInfoAssetFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfoAsset interviewDetailInfoInterviewInfoAsset = InterviewDetailInfoInterviewInfoAsset();
  final InterviewDetailInfoInterviewInfoAssetMonthlyIncome? monthlyIncome = jsonConvert.convert<InterviewDetailInfoInterviewInfoAssetMonthlyIncome>(json['monthly_income']);
  if (monthlyIncome != null) {
    interviewDetailInfoInterviewInfoAsset.monthlyIncome = monthlyIncome;
  }
  final InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow? lastMonthTransactionFlow = jsonConvert.convert<
      InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow>(json['last_month_transaction_flow']);
  if (lastMonthTransactionFlow != null) {
    interviewDetailInfoInterviewInfoAsset.lastMonthTransactionFlow = lastMonthTransactionFlow;
  }
  final InterviewDetailInfoInterviewInfoAssetInvestmentCertificate? investmentCertificate = jsonConvert.convert<InterviewDetailInfoInterviewInfoAssetInvestmentCertificate>(
      json['investment_certificate']);
  if (investmentCertificate != null) {
    interviewDetailInfoInterviewInfoAsset.investmentCertificate = investmentCertificate;
  }
  final InterviewDetailInfoInterviewInfoAssetProofOfEmployment? proofOfEmployment = jsonConvert.convert<InterviewDetailInfoInterviewInfoAssetProofOfEmployment>(
      json['proof_of_employment']);
  if (proofOfEmployment != null) {
    interviewDetailInfoInterviewInfoAsset.proofOfEmployment = proofOfEmployment;
  }
  final InterviewDetailInfoInterviewInfoAssetOtherAssets? otherAssets = jsonConvert.convert<InterviewDetailInfoInterviewInfoAssetOtherAssets>(json['other_assets']);
  if (otherAssets != null) {
    interviewDetailInfoInterviewInfoAsset.otherAssets = otherAssets;
  }
  final InterviewDetailInfoInterviewInfoAssetLandOwnership? landOwnership = jsonConvert.convert<InterviewDetailInfoInterviewInfoAssetLandOwnership>(json['land_ownership']);
  if (landOwnership != null) {
    interviewDetailInfoInterviewInfoAsset.landOwnership = landOwnership;
  }
  final InterviewDetailInfoInterviewInfoAssetHouseOwnership? houseOwnership = jsonConvert.convert<InterviewDetailInfoInterviewInfoAssetHouseOwnership>(json['house_ownership']);
  if (houseOwnership != null) {
    interviewDetailInfoInterviewInfoAsset.houseOwnership = houseOwnership;
  }
  final InterviewDetailInfoInterviewInfoAssetShopAssets? shopAssets = jsonConvert.convert<InterviewDetailInfoInterviewInfoAssetShopAssets>(json['shop_assets']);
  if (shopAssets != null) {
    interviewDetailInfoInterviewInfoAsset.shopAssets = shopAssets;
  }
  final InterviewDetailInfoInterviewInfoAssetLivestockAssets? livestockAssets = jsonConvert.convert<InterviewDetailInfoInterviewInfoAssetLivestockAssets>(json['livestock_assets']);
  if (livestockAssets != null) {
    interviewDetailInfoInterviewInfoAsset.livestockAssets = livestockAssets;
  }
  final InterviewDetailInfoInterviewInfoAssetMotorVehicles? motorVehicles = jsonConvert.convert<InterviewDetailInfoInterviewInfoAssetMotorVehicles>(json['motor_vehicles']);
  if (motorVehicles != null) {
    interviewDetailInfoInterviewInfoAsset.motorVehicles = motorVehicles;
  }
  return interviewDetailInfoInterviewInfoAsset;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoAssetToJson(InterviewDetailInfoInterviewInfoAsset entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['monthly_income'] = entity.monthlyIncome?.toJson();
  data['last_month_transaction_flow'] = entity.lastMonthTransactionFlow?.toJson();
  data['investment_certificate'] = entity.investmentCertificate?.toJson();
  data['proof_of_employment'] = entity.proofOfEmployment?.toJson();
  data['other_assets'] = entity.otherAssets?.toJson();
  data['land_ownership'] = entity.landOwnership?.toJson();
  data['house_ownership'] = entity.houseOwnership?.toJson();
  data['shop_assets'] = entity.shopAssets?.toJson();
  data['livestock_assets'] = entity.livestockAssets?.toJson();
  data['motor_vehicles'] = entity.motorVehicles?.toJson();
  return data;
}

extension InterviewDetailInfoInterviewInfoAssetExtension on InterviewDetailInfoInterviewInfoAsset {
  InterviewDetailInfoInterviewInfoAsset copyWith({
    InterviewDetailInfoInterviewInfoAssetMonthlyIncome? monthlyIncome,
    InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow? lastMonthTransactionFlow,
    InterviewDetailInfoInterviewInfoAssetInvestmentCertificate? investmentCertificate,
    InterviewDetailInfoInterviewInfoAssetProofOfEmployment? proofOfEmployment,
    InterviewDetailInfoInterviewInfoAssetOtherAssets? otherAssets,
    InterviewDetailInfoInterviewInfoAssetLandOwnership? landOwnership,
    InterviewDetailInfoInterviewInfoAssetHouseOwnership? houseOwnership,
    InterviewDetailInfoInterviewInfoAssetShopAssets? shopAssets,
    InterviewDetailInfoInterviewInfoAssetLivestockAssets? livestockAssets,
    InterviewDetailInfoInterviewInfoAssetMotorVehicles? motorVehicles,
  }) {
    return InterviewDetailInfoInterviewInfoAsset()
      ..monthlyIncome = monthlyIncome ?? this.monthlyIncome
      ..lastMonthTransactionFlow = lastMonthTransactionFlow ?? this.lastMonthTransactionFlow
      ..investmentCertificate = investmentCertificate ?? this.investmentCertificate
      ..proofOfEmployment = proofOfEmployment ?? this.proofOfEmployment
      ..otherAssets = otherAssets ?? this.otherAssets
      ..landOwnership = landOwnership ?? this.landOwnership
      ..houseOwnership = houseOwnership ?? this.houseOwnership
      ..shopAssets = shopAssets ?? this.shopAssets
      ..livestockAssets = livestockAssets ?? this.livestockAssets
      ..motorVehicles = motorVehicles ?? this.motorVehicles;
  }
}

InterviewDetailInfoInterviewInfoAssetMonthlyIncome $InterviewDetailInfoInterviewInfoAssetMonthlyIncomeFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfoAssetMonthlyIncome interviewDetailInfoInterviewInfoAssetMonthlyIncome = InterviewDetailInfoInterviewInfoAssetMonthlyIncome();
  final String? cateId = jsonConvert.convert<String>(json['cate_id']);
  if (cateId != null) {
    interviewDetailInfoInterviewInfoAssetMonthlyIncome.cateId = cateId;
  }
  final List<String>? imgs = (json['imgs'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (imgs != null) {
    interviewDetailInfoInterviewInfoAssetMonthlyIncome.imgs = imgs;
  }
  final String? addition = jsonConvert.convert<String>(json['addition']);
  if (addition != null) {
    interviewDetailInfoInterviewInfoAssetMonthlyIncome.addition = addition;
  }
  return interviewDetailInfoInterviewInfoAssetMonthlyIncome;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoAssetMonthlyIncomeToJson(InterviewDetailInfoInterviewInfoAssetMonthlyIncome entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cate_id'] = entity.cateId;
  data['imgs'] = entity.imgs;
  data['addition'] = entity.addition;
  return data;
}

extension InterviewDetailInfoInterviewInfoAssetMonthlyIncomeExtension on InterviewDetailInfoInterviewInfoAssetMonthlyIncome {
  InterviewDetailInfoInterviewInfoAssetMonthlyIncome copyWith({
    String? cateId,
    List<String>? imgs,
    String? addition,
  }) {
    return InterviewDetailInfoInterviewInfoAssetMonthlyIncome()
      ..cateId = cateId ?? this.cateId
      ..imgs = imgs ?? this.imgs
      ..addition = addition ?? this.addition;
  }
}

InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow $InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlowFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow interviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow = InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow();
  final String? cateId = jsonConvert.convert<String>(json['cate_id']);
  if (cateId != null) {
    interviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow.cateId = cateId;
  }
  final List<String>? imgs = (json['imgs'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (imgs != null) {
    interviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow.imgs = imgs;
  }
  final String? addition = jsonConvert.convert<String>(json['addition']);
  if (addition != null) {
    interviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow.addition = addition;
  }
  return interviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlowToJson(InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cate_id'] = entity.cateId;
  data['imgs'] = entity.imgs;
  data['addition'] = entity.addition;
  return data;
}

extension InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlowExtension on InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow {
  InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow copyWith({
    String? cateId,
    List<String>? imgs,
    String? addition,
  }) {
    return InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow()
      ..cateId = cateId ?? this.cateId
      ..imgs = imgs ?? this.imgs
      ..addition = addition ?? this.addition;
  }
}

InterviewDetailInfoInterviewInfoAssetInvestmentCertificate $InterviewDetailInfoInterviewInfoAssetInvestmentCertificateFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfoAssetInvestmentCertificate interviewDetailInfoInterviewInfoAssetInvestmentCertificate = InterviewDetailInfoInterviewInfoAssetInvestmentCertificate();
  final String? cateId = jsonConvert.convert<String>(json['cate_id']);
  if (cateId != null) {
    interviewDetailInfoInterviewInfoAssetInvestmentCertificate.cateId = cateId;
  }
  final List<String>? imgs = (json['imgs'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (imgs != null) {
    interviewDetailInfoInterviewInfoAssetInvestmentCertificate.imgs = imgs;
  }
  final String? addition = jsonConvert.convert<String>(json['addition']);
  if (addition != null) {
    interviewDetailInfoInterviewInfoAssetInvestmentCertificate.addition = addition;
  }
  return interviewDetailInfoInterviewInfoAssetInvestmentCertificate;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoAssetInvestmentCertificateToJson(InterviewDetailInfoInterviewInfoAssetInvestmentCertificate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cate_id'] = entity.cateId;
  data['imgs'] = entity.imgs;
  data['addition'] = entity.addition;
  return data;
}

extension InterviewDetailInfoInterviewInfoAssetInvestmentCertificateExtension on InterviewDetailInfoInterviewInfoAssetInvestmentCertificate {
  InterviewDetailInfoInterviewInfoAssetInvestmentCertificate copyWith({
    String? cateId,
    List<String>? imgs,
    String? addition,
  }) {
    return InterviewDetailInfoInterviewInfoAssetInvestmentCertificate()
      ..cateId = cateId ?? this.cateId
      ..imgs = imgs ?? this.imgs
      ..addition = addition ?? this.addition;
  }
}

InterviewDetailInfoInterviewInfoAssetProofOfEmployment $InterviewDetailInfoInterviewInfoAssetProofOfEmploymentFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfoAssetProofOfEmployment interviewDetailInfoInterviewInfoAssetProofOfEmployment = InterviewDetailInfoInterviewInfoAssetProofOfEmployment();
  final String? cateId = jsonConvert.convert<String>(json['cate_id']);
  if (cateId != null) {
    interviewDetailInfoInterviewInfoAssetProofOfEmployment.cateId = cateId;
  }
  final List<String>? imgs = (json['imgs'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (imgs != null) {
    interviewDetailInfoInterviewInfoAssetProofOfEmployment.imgs = imgs;
  }
  final String? addition = jsonConvert.convert<String>(json['addition']);
  if (addition != null) {
    interviewDetailInfoInterviewInfoAssetProofOfEmployment.addition = addition;
  }
  return interviewDetailInfoInterviewInfoAssetProofOfEmployment;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoAssetProofOfEmploymentToJson(InterviewDetailInfoInterviewInfoAssetProofOfEmployment entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cate_id'] = entity.cateId;
  data['imgs'] = entity.imgs;
  data['addition'] = entity.addition;
  return data;
}

extension InterviewDetailInfoInterviewInfoAssetProofOfEmploymentExtension on InterviewDetailInfoInterviewInfoAssetProofOfEmployment {
  InterviewDetailInfoInterviewInfoAssetProofOfEmployment copyWith({
    String? cateId,
    List<String>? imgs,
    String? addition,
  }) {
    return InterviewDetailInfoInterviewInfoAssetProofOfEmployment()
      ..cateId = cateId ?? this.cateId
      ..imgs = imgs ?? this.imgs
      ..addition = addition ?? this.addition;
  }
}

InterviewDetailInfoInterviewInfoAssetOtherAssets $InterviewDetailInfoInterviewInfoAssetOtherAssetsFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfoAssetOtherAssets interviewDetailInfoInterviewInfoAssetOtherAssets = InterviewDetailInfoInterviewInfoAssetOtherAssets();
  final String? cateId = jsonConvert.convert<String>(json['cate_id']);
  if (cateId != null) {
    interviewDetailInfoInterviewInfoAssetOtherAssets.cateId = cateId;
  }
  final List<String>? imgs = (json['imgs'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (imgs != null) {
    interviewDetailInfoInterviewInfoAssetOtherAssets.imgs = imgs;
  }
  final String? addition = jsonConvert.convert<String>(json['addition']);
  if (addition != null) {
    interviewDetailInfoInterviewInfoAssetOtherAssets.addition = addition;
  }
  return interviewDetailInfoInterviewInfoAssetOtherAssets;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoAssetOtherAssetsToJson(InterviewDetailInfoInterviewInfoAssetOtherAssets entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cate_id'] = entity.cateId;
  data['imgs'] = entity.imgs;
  data['addition'] = entity.addition;
  return data;
}

extension InterviewDetailInfoInterviewInfoAssetOtherAssetsExtension on InterviewDetailInfoInterviewInfoAssetOtherAssets {
  InterviewDetailInfoInterviewInfoAssetOtherAssets copyWith({
    String? cateId,
    List<String>? imgs,
    String? addition,
  }) {
    return InterviewDetailInfoInterviewInfoAssetOtherAssets()
      ..cateId = cateId ?? this.cateId
      ..imgs = imgs ?? this.imgs
      ..addition = addition ?? this.addition;
  }
}

InterviewDetailInfoInterviewInfoAssetLandOwnership $InterviewDetailInfoInterviewInfoAssetLandOwnershipFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfoAssetLandOwnership interviewDetailInfoInterviewInfoAssetLandOwnership = InterviewDetailInfoInterviewInfoAssetLandOwnership();
  final String? cateId = jsonConvert.convert<String>(json['cate_id']);
  if (cateId != null) {
    interviewDetailInfoInterviewInfoAssetLandOwnership.cateId = cateId;
  }
  final List<String>? imgs = (json['imgs'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (imgs != null) {
    interviewDetailInfoInterviewInfoAssetLandOwnership.imgs = imgs;
  }
  final String? addition = jsonConvert.convert<String>(json['addition']);
  if (addition != null) {
    interviewDetailInfoInterviewInfoAssetLandOwnership.addition = addition;
  }
  return interviewDetailInfoInterviewInfoAssetLandOwnership;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoAssetLandOwnershipToJson(InterviewDetailInfoInterviewInfoAssetLandOwnership entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cate_id'] = entity.cateId;
  data['imgs'] = entity.imgs;
  data['addition'] = entity.addition;
  return data;
}

extension InterviewDetailInfoInterviewInfoAssetLandOwnershipExtension on InterviewDetailInfoInterviewInfoAssetLandOwnership {
  InterviewDetailInfoInterviewInfoAssetLandOwnership copyWith({
    String? cateId,
    List<String>? imgs,
    String? addition,
  }) {
    return InterviewDetailInfoInterviewInfoAssetLandOwnership()
      ..cateId = cateId ?? this.cateId
      ..imgs = imgs ?? this.imgs
      ..addition = addition ?? this.addition;
  }
}

InterviewDetailInfoInterviewInfoAssetHouseOwnership $InterviewDetailInfoInterviewInfoAssetHouseOwnershipFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfoAssetHouseOwnership interviewDetailInfoInterviewInfoAssetHouseOwnership = InterviewDetailInfoInterviewInfoAssetHouseOwnership();
  final String? cateId = jsonConvert.convert<String>(json['cate_id']);
  if (cateId != null) {
    interviewDetailInfoInterviewInfoAssetHouseOwnership.cateId = cateId;
  }
  final List<String>? imgs = (json['imgs'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (imgs != null) {
    interviewDetailInfoInterviewInfoAssetHouseOwnership.imgs = imgs;
  }
  final String? addition = jsonConvert.convert<String>(json['addition']);
  if (addition != null) {
    interviewDetailInfoInterviewInfoAssetHouseOwnership.addition = addition;
  }
  return interviewDetailInfoInterviewInfoAssetHouseOwnership;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoAssetHouseOwnershipToJson(InterviewDetailInfoInterviewInfoAssetHouseOwnership entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cate_id'] = entity.cateId;
  data['imgs'] = entity.imgs;
  data['addition'] = entity.addition;
  return data;
}

extension InterviewDetailInfoInterviewInfoAssetHouseOwnershipExtension on InterviewDetailInfoInterviewInfoAssetHouseOwnership {
  InterviewDetailInfoInterviewInfoAssetHouseOwnership copyWith({
    String? cateId,
    List<String>? imgs,
    String? addition,
  }) {
    return InterviewDetailInfoInterviewInfoAssetHouseOwnership()
      ..cateId = cateId ?? this.cateId
      ..imgs = imgs ?? this.imgs
      ..addition = addition ?? this.addition;
  }
}

InterviewDetailInfoInterviewInfoAssetShopAssets $InterviewDetailInfoInterviewInfoAssetShopAssetsFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfoAssetShopAssets interviewDetailInfoInterviewInfoAssetShopAssets = InterviewDetailInfoInterviewInfoAssetShopAssets();
  final String? cateId = jsonConvert.convert<String>(json['cate_id']);
  if (cateId != null) {
    interviewDetailInfoInterviewInfoAssetShopAssets.cateId = cateId;
  }
  final List<String>? imgs = (json['imgs'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (imgs != null) {
    interviewDetailInfoInterviewInfoAssetShopAssets.imgs = imgs;
  }
  final String? addition = jsonConvert.convert<String>(json['addition']);
  if (addition != null) {
    interviewDetailInfoInterviewInfoAssetShopAssets.addition = addition;
  }
  return interviewDetailInfoInterviewInfoAssetShopAssets;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoAssetShopAssetsToJson(InterviewDetailInfoInterviewInfoAssetShopAssets entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cate_id'] = entity.cateId;
  data['imgs'] = entity.imgs;
  data['addition'] = entity.addition;
  return data;
}

extension InterviewDetailInfoInterviewInfoAssetShopAssetsExtension on InterviewDetailInfoInterviewInfoAssetShopAssets {
  InterviewDetailInfoInterviewInfoAssetShopAssets copyWith({
    String? cateId,
    List<String>? imgs,
    String? addition,
  }) {
    return InterviewDetailInfoInterviewInfoAssetShopAssets()
      ..cateId = cateId ?? this.cateId
      ..imgs = imgs ?? this.imgs
      ..addition = addition ?? this.addition;
  }
}

InterviewDetailInfoInterviewInfoAssetLivestockAssets $InterviewDetailInfoInterviewInfoAssetLivestockAssetsFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfoAssetLivestockAssets interviewDetailInfoInterviewInfoAssetLivestockAssets = InterviewDetailInfoInterviewInfoAssetLivestockAssets();
  final String? cateId = jsonConvert.convert<String>(json['cate_id']);
  if (cateId != null) {
    interviewDetailInfoInterviewInfoAssetLivestockAssets.cateId = cateId;
  }
  final List<String>? imgs = (json['imgs'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (imgs != null) {
    interviewDetailInfoInterviewInfoAssetLivestockAssets.imgs = imgs;
  }
  final String? addition = jsonConvert.convert<String>(json['addition']);
  if (addition != null) {
    interviewDetailInfoInterviewInfoAssetLivestockAssets.addition = addition;
  }
  return interviewDetailInfoInterviewInfoAssetLivestockAssets;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoAssetLivestockAssetsToJson(InterviewDetailInfoInterviewInfoAssetLivestockAssets entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cate_id'] = entity.cateId;
  data['imgs'] = entity.imgs;
  data['addition'] = entity.addition;
  return data;
}

extension InterviewDetailInfoInterviewInfoAssetLivestockAssetsExtension on InterviewDetailInfoInterviewInfoAssetLivestockAssets {
  InterviewDetailInfoInterviewInfoAssetLivestockAssets copyWith({
    String? cateId,
    List<String>? imgs,
    String? addition,
  }) {
    return InterviewDetailInfoInterviewInfoAssetLivestockAssets()
      ..cateId = cateId ?? this.cateId
      ..imgs = imgs ?? this.imgs
      ..addition = addition ?? this.addition;
  }
}

InterviewDetailInfoInterviewInfoAssetMotorVehicles $InterviewDetailInfoInterviewInfoAssetMotorVehiclesFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfoAssetMotorVehicles interviewDetailInfoInterviewInfoAssetMotorVehicles = InterviewDetailInfoInterviewInfoAssetMotorVehicles();
  final String? cateId = jsonConvert.convert<String>(json['cate_id']);
  if (cateId != null) {
    interviewDetailInfoInterviewInfoAssetMotorVehicles.cateId = cateId;
  }
  final List<String>? imgs = (json['imgs'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (imgs != null) {
    interviewDetailInfoInterviewInfoAssetMotorVehicles.imgs = imgs;
  }
  final String? addition = jsonConvert.convert<String>(json['addition']);
  if (addition != null) {
    interviewDetailInfoInterviewInfoAssetMotorVehicles.addition = addition;
  }
  return interviewDetailInfoInterviewInfoAssetMotorVehicles;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoAssetMotorVehiclesToJson(InterviewDetailInfoInterviewInfoAssetMotorVehicles entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cate_id'] = entity.cateId;
  data['imgs'] = entity.imgs;
  data['addition'] = entity.addition;
  return data;
}

extension InterviewDetailInfoInterviewInfoAssetMotorVehiclesExtension on InterviewDetailInfoInterviewInfoAssetMotorVehicles {
  InterviewDetailInfoInterviewInfoAssetMotorVehicles copyWith({
    String? cateId,
    List<String>? imgs,
    String? addition,
  }) {
    return InterviewDetailInfoInterviewInfoAssetMotorVehicles()
      ..cateId = cateId ?? this.cateId
      ..imgs = imgs ?? this.imgs
      ..addition = addition ?? this.addition;
  }
}

InterviewDetailInfoInterviewInfoAccount $InterviewDetailInfoInterviewInfoAccountFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoInterviewInfoAccount interviewDetailInfoInterviewInfoAccount = InterviewDetailInfoInterviewInfoAccount();
  final String? withdrawRelation = jsonConvert.convert<String>(json['withdraw_relation']);
  if (withdrawRelation != null) {
    interviewDetailInfoInterviewInfoAccount.withdrawRelation = withdrawRelation;
  }
  final String? accountNo = jsonConvert.convert<String>(json['account_no']);
  if (accountNo != null) {
    interviewDetailInfoInterviewInfoAccount.accountNo = accountNo;
  }
  final String? accountHolder = jsonConvert.convert<String>(json['account_holder']);
  if (accountHolder != null) {
    interviewDetailInfoInterviewInfoAccount.accountHolder = accountHolder;
  }
  final String? channelName = jsonConvert.convert<String>(json['channel_name']);
  if (channelName != null) {
    interviewDetailInfoInterviewInfoAccount.channelName = channelName;
  }
  final String? withdrawType = jsonConvert.convert<String>(json['withdraw_type']);
  if (withdrawType != null) {
    interviewDetailInfoInterviewInfoAccount.withdrawType = withdrawType;
  }
  return interviewDetailInfoInterviewInfoAccount;
}

Map<String, dynamic> $InterviewDetailInfoInterviewInfoAccountToJson(InterviewDetailInfoInterviewInfoAccount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['withdraw_relation'] = entity.withdrawRelation;
  data['account_no'] = entity.accountNo;
  data['account_holder'] = entity.accountHolder;
  data['channel_name'] = entity.channelName;
  data['withdraw_type'] = entity.withdrawType;
  return data;
}

extension InterviewDetailInfoInterviewInfoAccountExtension on InterviewDetailInfoInterviewInfoAccount {
  InterviewDetailInfoInterviewInfoAccount copyWith({
    String? withdrawRelation,
    String? accountNo,
    String? accountHolder,
    String? channelName,
    String? withdrawType,
  }) {
    return InterviewDetailInfoInterviewInfoAccount()
      ..withdrawRelation = withdrawRelation ?? this.withdrawRelation
      ..accountNo = accountNo ?? this.accountNo
      ..accountHolder = accountHolder ?? this.accountHolder
      ..channelName = channelName ?? this.channelName
      ..withdrawType = withdrawType ?? this.withdrawType;
  }
}

InterviewDetailInfoClientInfo $InterviewDetailInfoClientInfoFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoClientInfo interviewDetailInfoClientInfo = InterviewDetailInfoClientInfo();
  final InterviewDetailInfoClientInfoCredit? credit = jsonConvert.convert<InterviewDetailInfoClientInfoCredit>(json['credit']);
  if (credit != null) {
    interviewDetailInfoClientInfo.credit = credit;
  }
  final InterviewDetailInfoClientInfoPhotos? photos = jsonConvert.convert<InterviewDetailInfoClientInfoPhotos>(json['photos']);
  if (photos != null) {
    interviewDetailInfoClientInfo.photos = photos;
  }
  final InterviewDetailInfoClientInfoBaseInfo? baseInfo = jsonConvert.convert<InterviewDetailInfoClientInfoBaseInfo>(json['base_info']);
  if (baseInfo != null) {
    interviewDetailInfoClientInfo.baseInfo = baseInfo;
  }
  return interviewDetailInfoClientInfo;
}

Map<String, dynamic> $InterviewDetailInfoClientInfoToJson(InterviewDetailInfoClientInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['credit'] = entity.credit.toJson();
  data['photos'] = entity.photos.toJson();
  data['base_info'] = entity.baseInfo.toJson();
  return data;
}

extension InterviewDetailInfoClientInfoExtension on InterviewDetailInfoClientInfo {
  InterviewDetailInfoClientInfo copyWith({
    InterviewDetailInfoClientInfoCredit? credit,
    InterviewDetailInfoClientInfoPhotos? photos,
    InterviewDetailInfoClientInfoBaseInfo? baseInfo,
  }) {
    return InterviewDetailInfoClientInfo()
      ..credit = credit ?? this.credit
      ..photos = photos ?? this.photos
      ..baseInfo = baseInfo ?? this.baseInfo;
  }
}

InterviewDetailInfoClientInfoCredit $InterviewDetailInfoClientInfoCreditFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoClientInfoCredit interviewDetailInfoClientInfoCredit = InterviewDetailInfoClientInfoCredit();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    interviewDetailInfoClientInfoCredit.amount = amount;
  }
  final String? insNum = jsonConvert.convert<String>(json['ins_num']);
  if (insNum != null) {
    interviewDetailInfoClientInfoCredit.insNum = insNum;
  }
  final String? loanDays = jsonConvert.convert<String>(json['loan_days']);
  if (loanDays != null) {
    interviewDetailInfoClientInfoCredit.loanDays = loanDays;
  }
  return interviewDetailInfoClientInfoCredit;
}

Map<String, dynamic> $InterviewDetailInfoClientInfoCreditToJson(InterviewDetailInfoClientInfoCredit entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['ins_num'] = entity.insNum;
  data['loan_days'] = entity.loanDays;
  return data;
}

extension InterviewDetailInfoClientInfoCreditExtension on InterviewDetailInfoClientInfoCredit {
  InterviewDetailInfoClientInfoCredit copyWith({
    String? amount,
    String? insNum,
    String? loanDays,
  }) {
    return InterviewDetailInfoClientInfoCredit()
      ..amount = amount ?? this.amount
      ..insNum = insNum ?? this.insNum
      ..loanDays = loanDays ?? this.loanDays;
  }
}

InterviewDetailInfoClientInfoPhotos $InterviewDetailInfoClientInfoPhotosFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoClientInfoPhotos interviewDetailInfoClientInfoPhotos = InterviewDetailInfoClientInfoPhotos();
  final String? activityPhoto = jsonConvert.convert<String>(json['activity_photo']);
  if (activityPhoto != null) {
    interviewDetailInfoClientInfoPhotos.activityPhoto = activityPhoto;
  }
  final String? identifyPhoto = jsonConvert.convert<String>(json['identify_photo']);
  if (identifyPhoto != null) {
    interviewDetailInfoClientInfoPhotos.identifyPhoto = identifyPhoto;
  }
  final String? identityType = jsonConvert.convert<String>(json['identity_type']);
  if (identityType != null) {
    interviewDetailInfoClientInfoPhotos.identityType = identityType;
  }
  return interviewDetailInfoClientInfoPhotos;
}

Map<String, dynamic> $InterviewDetailInfoClientInfoPhotosToJson(InterviewDetailInfoClientInfoPhotos entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['activity_photo'] = entity.activityPhoto;
  data['identify_photo'] = entity.identifyPhoto;
  data['identity_type'] = entity.identityType;
  return data;
}

extension InterviewDetailInfoClientInfoPhotosExtension on InterviewDetailInfoClientInfoPhotos {
  InterviewDetailInfoClientInfoPhotos copyWith({
    String? activityPhoto,
    String? identifyPhoto,
    String? identityType,
  }) {
    return InterviewDetailInfoClientInfoPhotos()
      ..activityPhoto = activityPhoto ?? this.activityPhoto
      ..identifyPhoto = identifyPhoto ?? this.identifyPhoto
      ..identityType = identityType ?? this.identityType;
  }
}

InterviewDetailInfoClientInfoBaseInfo $InterviewDetailInfoClientInfoBaseInfoFromJson(Map<String, dynamic> json) {
  final InterviewDetailInfoClientInfoBaseInfo interviewDetailInfoClientInfoBaseInfo = InterviewDetailInfoClientInfoBaseInfo();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    interviewDetailInfoClientInfoBaseInfo.name = name;
  }
  final String? gender = jsonConvert.convert<String>(json['gender']);
  if (gender != null) {
    interviewDetailInfoClientInfoBaseInfo.gender = gender;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    interviewDetailInfoClientInfoBaseInfo.birthday = birthday;
  }
  final String? idCardNumber = jsonConvert.convert<String>(json['id_card_number']);
  if (idCardNumber != null) {
    interviewDetailInfoClientInfoBaseInfo.idCardNumber = idCardNumber;
  }
  final String? educationBackground = jsonConvert.convert<String>(json['education_background']);
  if (educationBackground != null) {
    interviewDetailInfoClientInfoBaseInfo.educationBackground = educationBackground;
  }
  final String? maritalStatus = jsonConvert.convert<String>(json['marital_status']);
  if (maritalStatus != null) {
    interviewDetailInfoClientInfoBaseInfo.maritalStatus = maritalStatus;
  }
  final String? numberOfChildren = jsonConvert.convert<String>(json['number_of_children']);
  if (numberOfChildren != null) {
    interviewDetailInfoClientInfoBaseInfo.numberOfChildren = numberOfChildren;
  }
  final String? usageOfLoan = jsonConvert.convert<String>(json['usage_of_loan']);
  if (usageOfLoan != null) {
    interviewDetailInfoClientInfoBaseInfo.usageOfLoan = usageOfLoan;
  }
  final String? industryCategory = jsonConvert.convert<String>(json['industry_category']);
  if (industryCategory != null) {
    interviewDetailInfoClientInfoBaseInfo.industryCategory = industryCategory;
  }
  final String? monthlyIncome = jsonConvert.convert<String>(json['monthly_income']);
  if (monthlyIncome != null) {
    interviewDetailInfoClientInfoBaseInfo.monthlyIncome = monthlyIncome;
  }
  final String? workingExperience = jsonConvert.convert<String>(json['working_experience']);
  if (workingExperience != null) {
    interviewDetailInfoClientInfoBaseInfo.workingExperience = workingExperience;
  }
  final String? payday = jsonConvert.convert<String>(json['payday']);
  if (payday != null) {
    interviewDetailInfoClientInfoBaseInfo.payday = payday;
  }
  final String? residentialOwnership = jsonConvert.convert<String>(json['residential_ownership']);
  if (residentialOwnership != null) {
    interviewDetailInfoClientInfoBaseInfo.residentialOwnership = residentialOwnership;
  }
  final String? companyName = jsonConvert.convert<String>(json['company_name']);
  if (companyName != null) {
    interviewDetailInfoClientInfoBaseInfo.companyName = companyName;
  }
  final String? facebookLink = jsonConvert.convert<String>(json['facebook_link']);
  if (facebookLink != null) {
    interviewDetailInfoClientInfoBaseInfo.facebookLink = facebookLink;
  }
  final String? clientTel = jsonConvert.convert<String>(json['client_tel']);
  if (clientTel != null) {
    interviewDetailInfoClientInfoBaseInfo.clientTel = clientTel;
  }
  final String? alterPhone = jsonConvert.convert<String>(json['alter_phone']);
  if (alterPhone != null) {
    interviewDetailInfoClientInfoBaseInfo.alterPhone = alterPhone;
  }
  final String? viberPhone = jsonConvert.convert<String>(json['viber_phone']);
  if (viberPhone != null) {
    interviewDetailInfoClientInfoBaseInfo.viberPhone = viberPhone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    interviewDetailInfoClientInfoBaseInfo.email = email;
  }
  return interviewDetailInfoClientInfoBaseInfo;
}

Map<String, dynamic> $InterviewDetailInfoClientInfoBaseInfoToJson(InterviewDetailInfoClientInfoBaseInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['gender'] = entity.gender;
  data['birthday'] = entity.birthday;
  data['id_card_number'] = entity.idCardNumber;
  data['education_background'] = entity.educationBackground;
  data['marital_status'] = entity.maritalStatus;
  data['number_of_children'] = entity.numberOfChildren;
  data['usage_of_loan'] = entity.usageOfLoan;
  data['industry_category'] = entity.industryCategory;
  data['monthly_income'] = entity.monthlyIncome;
  data['working_experience'] = entity.workingExperience;
  data['payday'] = entity.payday;
  data['residential_ownership'] = entity.residentialOwnership;
  data['company_name'] = entity.companyName;
  data['facebook_link'] = entity.facebookLink;
  data['client_tel'] = entity.clientTel;
  data['alter_phone'] = entity.alterPhone;
  data['viber_phone'] = entity.viberPhone;
  data['email'] = entity.email;
  return data;
}

extension InterviewDetailInfoClientInfoBaseInfoExtension on InterviewDetailInfoClientInfoBaseInfo {
  InterviewDetailInfoClientInfoBaseInfo copyWith({
    String? name,
    String? gender,
    String? birthday,
    String? idCardNumber,
    String? educationBackground,
    String? maritalStatus,
    String? numberOfChildren,
    String? usageOfLoan,
    String? industryCategory,
    String? monthlyIncome,
    String? workingExperience,
    String? payday,
    String? residentialOwnership,
    String? companyName,
    String? facebookLink,
    String? clientTel,
    String? alterPhone,
    String? viberPhone,
    String? email,
  }) {
    return InterviewDetailInfoClientInfoBaseInfo()
      ..name = name ?? this.name
      ..gender = gender ?? this.gender
      ..birthday = birthday ?? this.birthday
      ..idCardNumber = idCardNumber ?? this.idCardNumber
      ..educationBackground = educationBackground ?? this.educationBackground
      ..maritalStatus = maritalStatus ?? this.maritalStatus
      ..numberOfChildren = numberOfChildren ?? this.numberOfChildren
      ..usageOfLoan = usageOfLoan ?? this.usageOfLoan
      ..industryCategory = industryCategory ?? this.industryCategory
      ..monthlyIncome = monthlyIncome ?? this.monthlyIncome
      ..workingExperience = workingExperience ?? this.workingExperience
      ..payday = payday ?? this.payday
      ..residentialOwnership = residentialOwnership ?? this.residentialOwnership
      ..companyName = companyName ?? this.companyName
      ..facebookLink = facebookLink ?? this.facebookLink
      ..clientTel = clientTel ?? this.clientTel
      ..alterPhone = alterPhone ?? this.alterPhone
      ..viberPhone = viberPhone ?? this.viberPhone
      ..email = email ?? this.email;
  }
}