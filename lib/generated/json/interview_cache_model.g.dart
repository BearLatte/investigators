import 'package:investigators/generated/json/base/json_convert_content.dart';
import 'package:investigators/models/interview_cache_model.dart';
import 'package:investigators/models/subcategory.dart';

InterviewCacheModel $InterviewCacheModelFromJson(Map<String, dynamic> json) {
  final InterviewCacheModel interviewCacheModel = InterviewCacheModel();
  final bool? nameStatus = jsonConvert.convert<bool>(json['name_status']);
  if (nameStatus != null) {
    interviewCacheModel.nameStatus = nameStatus;
  }
  final int? residentialStatus = jsonConvert.convert<int>(json['residential_status']);
  if (residentialStatus != null) {
    interviewCacheModel.residentialStatus = residentialStatus;
  }
  final int? companyStatus = jsonConvert.convert<int>(json['company_status']);
  if (companyStatus != null) {
    interviewCacheModel.companyStatus = companyStatus;
  }
  final bool? isInPerson = jsonConvert.convert<bool>(json['isInPerson']);
  if (isInPerson != null) {
    interviewCacheModel.isInPerson = isInPerson;
  }
  final List<String>? otherIdentificationPhotos = (json['other_identification_photos'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (otherIdentificationPhotos != null) {
    interviewCacheModel.otherIdentificationPhotos = otherIdentificationPhotos;
  }
  final InterviewCacheModelSalaryAsset? salaryAsset = jsonConvert.convert<InterviewCacheModelSalaryAsset>(json['salary_asset']);
  if (salaryAsset != null) {
    interviewCacheModel.salaryAsset = salaryAsset;
  }
  final InterviewCacheModelInvestmentInfo? investmentInfo = jsonConvert.convert<InterviewCacheModelInvestmentInfo>(json['investment_info']);
  if (investmentInfo != null) {
    interviewCacheModel.investmentInfo = investmentInfo;
  }
  final InterviewCacheModelIncumbencyInfo? incumbencyInfo = jsonConvert.convert<InterviewCacheModelIncumbencyInfo>(json['incumbency_info']);
  if (incumbencyInfo != null) {
    interviewCacheModel.incumbencyInfo = incumbencyInfo;
  }
  final InterviewCacheModelLandAsset? landAsset = jsonConvert.convert<InterviewCacheModelLandAsset>(json['land_asset']);
  if (landAsset != null) {
    interviewCacheModel.landAsset = landAsset;
  }
  final InterviewCacheModelHouseAsset? houseAsset = jsonConvert.convert<InterviewCacheModelHouseAsset>(json['house_asset']);
  if (houseAsset != null) {
    interviewCacheModel.houseAsset = houseAsset;
  }
  final InterviewCacheModelBusinessAsset? businessAsset = jsonConvert.convert<InterviewCacheModelBusinessAsset>(json['business_asset']);
  if (businessAsset != null) {
    interviewCacheModel.businessAsset = businessAsset;
  }
  final InterviewCacheModelLivestockAsset? livestockAsset = jsonConvert.convert<InterviewCacheModelLivestockAsset>(json['livestock_asset']);
  if (livestockAsset != null) {
    interviewCacheModel.livestockAsset = livestockAsset;
  }
  final InterviewCacheModelVehicle? vehicle = jsonConvert.convert<InterviewCacheModelVehicle>(json['vehicle']);
  if (vehicle != null) {
    interviewCacheModel.vehicle = vehicle;
  }
  final InterviewCacheModelOtherSupportingMaterials? otherSupportingMaterials =
      jsonConvert.convert<InterviewCacheModelOtherSupportingMaterials>(json['other_supporting_materials']);
  if (otherSupportingMaterials != null) {
    interviewCacheModel.otherSupportingMaterials = otherSupportingMaterials;
  }
  final InterviewCacheModelRefuseLoanInfo? refuseLoanInfo = jsonConvert.convert<InterviewCacheModelRefuseLoanInfo>(json['refuse_loan_info']);
  if (refuseLoanInfo != null) {
    interviewCacheModel.refuseLoanInfo = refuseLoanInfo;
  }
  return interviewCacheModel;
}

Map<String, dynamic> $InterviewCacheModelToJson(InterviewCacheModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name_status'] = entity.nameStatus;
  data['residential_status'] = entity.residentialStatus;
  data['company_status'] = entity.companyStatus;
  data['isInPerson'] = entity.isInPerson;
  data['other_identification_photos'] = entity.otherIdentificationPhotos;
  data['salary_asset'] = entity.salaryAsset?.toJson();
  data['investment_info'] = entity.investmentInfo?.toJson();
  data['incumbency_info'] = entity.incumbencyInfo?.toJson();
  data['land_asset'] = entity.landAsset?.toJson();
  data['house_asset'] = entity.houseAsset?.toJson();
  data['business_asset'] = entity.businessAsset?.toJson();
  data['livestock_asset'] = entity.livestockAsset?.toJson();
  data['vehicle'] = entity.vehicle?.toJson();
  data['other_supporting_materials'] = entity.otherSupportingMaterials?.toJson();
  data['refuse_loan_info'] = entity.refuseLoanInfo?.toJson();
  return data;
}

extension InterviewCacheModelExtension on InterviewCacheModel {
  InterviewCacheModel copyWith({
    bool? nameStatus,
    int? residentialStatus,
    int? companyStatus,
    bool? isInPerson,
    List<String>? otherIdentificationPhotos,
    InterviewCacheModelSalaryAsset? salaryAsset,
    InterviewCacheModelInvestmentInfo? investmentInfo,
    InterviewCacheModelIncumbencyInfo? incumbencyInfo,
    InterviewCacheModelLandAsset? landAsset,
    InterviewCacheModelHouseAsset? houseAsset,
    InterviewCacheModelBusinessAsset? businessAsset,
    InterviewCacheModelLivestockAsset? livestockAsset,
    InterviewCacheModelVehicle? vehicle,
    InterviewCacheModelOtherSupportingMaterials? otherSupportingMaterials,
    InterviewCacheModelRefuseLoanInfo? refuseLoanInfo,
  }) {
    return InterviewCacheModel()
      ..nameStatus = nameStatus ?? this.nameStatus
      ..residentialStatus = residentialStatus ?? this.residentialStatus
      ..companyStatus = companyStatus ?? this.companyStatus
      ..isInPerson = isInPerson ?? this.isInPerson
      ..otherIdentificationPhotos = otherIdentificationPhotos ?? this.otherIdentificationPhotos
      ..salaryAsset = salaryAsset ?? this.salaryAsset
      ..investmentInfo = investmentInfo ?? this.investmentInfo
      ..incumbencyInfo = incumbencyInfo ?? this.incumbencyInfo
      ..landAsset = landAsset ?? this.landAsset
      ..houseAsset = houseAsset ?? this.houseAsset
      ..businessAsset = businessAsset ?? this.businessAsset
      ..livestockAsset = livestockAsset ?? this.livestockAsset
      ..vehicle = vehicle ?? this.vehicle
      ..otherSupportingMaterials = otherSupportingMaterials ?? this.otherSupportingMaterials
      ..refuseLoanInfo = refuseLoanInfo ?? this.refuseLoanInfo;
  }
}

InterviewCacheModelSalaryAsset $InterviewCacheModelSalaryAssetFromJson(Map<String, dynamic> json) {
  final InterviewCacheModelSalaryAsset interviewCacheModelSalaryAsset = InterviewCacheModelSalaryAsset();
  final Subcategory? salary = jsonConvert.convert<Subcategory>(json['salary']);
  if (salary != null) {
    interviewCacheModelSalaryAsset.salary = salary;
  }
  final Subcategory? monthlyFlow = jsonConvert.convert<Subcategory>(json['monthly_flow']);
  if (monthlyFlow != null) {
    interviewCacheModelSalaryAsset.monthlyFlow = monthlyFlow;
  }
  final List<String>? salaryPhotos = (json['salary_photos'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (salaryPhotos != null) {
    interviewCacheModelSalaryAsset.salaryPhotos = salaryPhotos;
  }
  final List<String>? monthlyFlowPhotos = (json['monthly_flow_photos'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (monthlyFlowPhotos != null) {
    interviewCacheModelSalaryAsset.monthlyFlowPhotos = monthlyFlowPhotos;
  }
  return interviewCacheModelSalaryAsset;
}

Map<String, dynamic> $InterviewCacheModelSalaryAssetToJson(InterviewCacheModelSalaryAsset entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['salary'] = entity.salary?.toJson();
  data['monthly_flow'] = entity.monthlyFlow?.toJson();
  data['salary_photos'] = entity.salaryPhotos;
  data['monthly_flow_photos'] = entity.monthlyFlowPhotos;
  return data;
}

extension InterviewCacheModelSalaryAssetExtension on InterviewCacheModelSalaryAsset {
  InterviewCacheModelSalaryAsset copyWith({
    Subcategory? salary,
    Subcategory? monthlyFlow,
    List<String>? salaryPhotos,
    List<String>? monthlyFlowPhotos,
  }) {
    return InterviewCacheModelSalaryAsset()
      ..salary = salary ?? this.salary
      ..monthlyFlow = monthlyFlow ?? this.monthlyFlow
      ..salaryPhotos = salaryPhotos ?? this.salaryPhotos
      ..monthlyFlowPhotos = monthlyFlowPhotos ?? this.monthlyFlowPhotos;
  }
}

InterviewCacheModelInvestmentInfo $InterviewCacheModelInvestmentInfoFromJson(Map<String, dynamic> json) {
  final InterviewCacheModelInvestmentInfo interviewCacheModelInvestmentInfo = InterviewCacheModelInvestmentInfo();
  final Subcategory? investmentType = jsonConvert.convert<Subcategory>(json['investment_type']);
  if (investmentType != null) {
    interviewCacheModelInvestmentInfo.investmentType = investmentType;
  }
  final String? voucherValidity = jsonConvert.convert<String>(json['voucher_validity']);
  if (voucherValidity != null) {
    interviewCacheModelInvestmentInfo.voucherValidity = voucherValidity;
  }
  final String? voucherAmount = jsonConvert.convert<String>(json['voucher_amount']);
  if (voucherAmount != null) {
    interviewCacheModelInvestmentInfo.voucherAmount = voucherAmount;
  }
  final List<String>? photos = (json['photos'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (photos != null) {
    interviewCacheModelInvestmentInfo.photos = photos;
  }
  return interviewCacheModelInvestmentInfo;
}

Map<String, dynamic> $InterviewCacheModelInvestmentInfoToJson(InterviewCacheModelInvestmentInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['investment_type'] = entity.investmentType?.toJson();
  data['voucher_validity'] = entity.voucherValidity;
  data['voucher_amount'] = entity.voucherAmount;
  data['photos'] = entity.photos;
  return data;
}

extension InterviewCacheModelInvestmentInfoExtension on InterviewCacheModelInvestmentInfo {
  InterviewCacheModelInvestmentInfo copyWith({
    Subcategory? investmentType,
    String? voucherValidity,
    String? voucherAmount,
    List<String>? photos,
  }) {
    return InterviewCacheModelInvestmentInfo()
      ..investmentType = investmentType ?? this.investmentType
      ..voucherValidity = voucherValidity ?? this.voucherValidity
      ..voucherAmount = voucherAmount ?? this.voucherAmount
      ..photos = photos ?? this.photos;
  }
}

InterviewCacheModelIncumbencyInfo $InterviewCacheModelIncumbencyInfoFromJson(Map<String, dynamic> json) {
  final InterviewCacheModelIncumbencyInfo interviewCacheModelIncumbencyInfo = InterviewCacheModelIncumbencyInfo();
  final bool? badge = jsonConvert.convert<bool>(json['badge']);
  if (badge != null) {
    interviewCacheModelIncumbencyInfo.badge = badge;
  }
  final List<String>? photos = (json['photos'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (photos != null) {
    interviewCacheModelIncumbencyInfo.photos = photos;
  }
  return interviewCacheModelIncumbencyInfo;
}

Map<String, dynamic> $InterviewCacheModelIncumbencyInfoToJson(InterviewCacheModelIncumbencyInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['badge'] = entity.badge;
  data['photos'] = entity.photos;
  return data;
}

extension InterviewCacheModelIncumbencyInfoExtension on InterviewCacheModelIncumbencyInfo {
  InterviewCacheModelIncumbencyInfo copyWith({
    bool? badge,
    List<String>? photos,
  }) {
    return InterviewCacheModelIncumbencyInfo()
      ..badge = badge ?? this.badge
      ..photos = photos ?? this.photos;
  }
}

InterviewCacheModelLandAsset $InterviewCacheModelLandAssetFromJson(Map<String, dynamic> json) {
  final InterviewCacheModelLandAsset interviewCacheModelLandAsset = InterviewCacheModelLandAsset();
  final bool? holdStatus = jsonConvert.convert<bool>(json['hold_status']);
  if (holdStatus != null) {
    interviewCacheModelLandAsset.holdStatus = holdStatus;
  }
  final String? location = jsonConvert.convert<String>(json['location']);
  if (location != null) {
    interviewCacheModelLandAsset.location = location;
  }
  final String? locationCode = jsonConvert.convert<String>(json['location_code']);
  if (locationCode != null) {
    interviewCacheModelLandAsset.locationCode = locationCode;
  }
  final String? fullAddress = jsonConvert.convert<String>(json['full_address']);
  if (fullAddress != null) {
    interviewCacheModelLandAsset.fullAddress = fullAddress;
  }
  final String? estimatedArea = jsonConvert.convert<String>(json['estimated_area']);
  if (estimatedArea != null) {
    interviewCacheModelLandAsset.estimatedArea = estimatedArea;
  }
  final String? marketValue = jsonConvert.convert<String>(json['market_value']);
  if (marketValue != null) {
    interviewCacheModelLandAsset.marketValue = marketValue;
  }
  final List<String>? photos = (json['photos'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (photos != null) {
    interviewCacheModelLandAsset.photos = photos;
  }
  return interviewCacheModelLandAsset;
}

Map<String, dynamic> $InterviewCacheModelLandAssetToJson(InterviewCacheModelLandAsset entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['hold_status'] = entity.holdStatus;
  data['location'] = entity.location;
  data['location_code'] = entity.locationCode;
  data['full_address'] = entity.fullAddress;
  data['estimated_area'] = entity.estimatedArea;
  data['market_value'] = entity.marketValue;
  data['photos'] = entity.photos;
  return data;
}

extension InterviewCacheModelLandAssetExtension on InterviewCacheModelLandAsset {
  InterviewCacheModelLandAsset copyWith({
    bool? holdStatus,
    String? location,
    String? locationCode,
    String? fullAddress,
    String? estimatedArea,
    String? marketValue,
    List<String>? photos,
  }) {
    return InterviewCacheModelLandAsset()
      ..holdStatus = holdStatus ?? this.holdStatus
      ..location = location ?? this.location
      ..locationCode = locationCode ?? this.locationCode
      ..fullAddress = fullAddress ?? this.fullAddress
      ..estimatedArea = estimatedArea ?? this.estimatedArea
      ..marketValue = marketValue ?? this.marketValue
      ..photos = photos ?? this.photos;
  }
}

InterviewCacheModelHouseAsset $InterviewCacheModelHouseAssetFromJson(Map<String, dynamic> json) {
  final InterviewCacheModelHouseAsset interviewCacheModelHouseAsset = InterviewCacheModelHouseAsset();
  final bool? holdStatus = jsonConvert.convert<bool>(json['hold_status']);
  if (holdStatus != null) {
    interviewCacheModelHouseAsset.holdStatus = holdStatus;
  }
  final String? location = jsonConvert.convert<String>(json['location']);
  if (location != null) {
    interviewCacheModelHouseAsset.location = location;
  }
  final String? locationCode = jsonConvert.convert<String>(json['location_code']);
  if (locationCode != null) {
    interviewCacheModelHouseAsset.locationCode = locationCode;
  }
  final String? fullAddress = jsonConvert.convert<String>(json['full_address']);
  if (fullAddress != null) {
    interviewCacheModelHouseAsset.fullAddress = fullAddress;
  }
  final String? purchaseTime = jsonConvert.convert<String>(json['purchase_time']);
  if (purchaseTime != null) {
    interviewCacheModelHouseAsset.purchaseTime = purchaseTime;
  }
  final String? purchasePrice = jsonConvert.convert<String>(json['purchase_price']);
  if (purchasePrice != null) {
    interviewCacheModelHouseAsset.purchasePrice = purchasePrice;
  }
  final String? marketValue = jsonConvert.convert<String>(json['market_value']);
  if (marketValue != null) {
    interviewCacheModelHouseAsset.marketValue = marketValue;
  }
  final List<String>? photos = (json['photos'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (photos != null) {
    interviewCacheModelHouseAsset.photos = photos;
  }
  return interviewCacheModelHouseAsset;
}

Map<String, dynamic> $InterviewCacheModelHouseAssetToJson(InterviewCacheModelHouseAsset entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['hold_status'] = entity.holdStatus;
  data['location'] = entity.location;
  data['location_code'] = entity.locationCode;
  data['full_address'] = entity.fullAddress;
  data['purchase_time'] = entity.purchaseTime;
  data['purchase_price'] = entity.purchasePrice;
  data['market_value'] = entity.marketValue;
  data['photos'] = entity.photos;
  return data;
}

extension InterviewCacheModelHouseAssetExtension on InterviewCacheModelHouseAsset {
  InterviewCacheModelHouseAsset copyWith({
    bool? holdStatus,
    String? location,
    String? locationCode,
    String? fullAddress,
    String? purchaseTime,
    String? purchasePrice,
    String? marketValue,
    List<String>? photos,
  }) {
    return InterviewCacheModelHouseAsset()
      ..holdStatus = holdStatus ?? this.holdStatus
      ..location = location ?? this.location
      ..locationCode = locationCode ?? this.locationCode
      ..fullAddress = fullAddress ?? this.fullAddress
      ..purchaseTime = purchaseTime ?? this.purchaseTime
      ..purchasePrice = purchasePrice ?? this.purchasePrice
      ..marketValue = marketValue ?? this.marketValue
      ..photos = photos ?? this.photos;
  }
}

InterviewCacheModelBusinessAsset $InterviewCacheModelBusinessAssetFromJson(Map<String, dynamic> json) {
  final InterviewCacheModelBusinessAsset interviewCacheModelBusinessAsset = InterviewCacheModelBusinessAsset();
  final bool? holdStatus = jsonConvert.convert<bool>(json['hold_status']);
  if (holdStatus != null) {
    interviewCacheModelBusinessAsset.holdStatus = holdStatus;
  }
  final String? location = jsonConvert.convert<String>(json['location']);
  if (location != null) {
    interviewCacheModelBusinessAsset.location = location;
  }
  final String? locationCode = jsonConvert.convert<String>(json['location_code']);
  if (locationCode != null) {
    interviewCacheModelBusinessAsset.locationCode = locationCode;
  }
  final String? fullAddress = jsonConvert.convert<String>(json['full_address']);
  if (fullAddress != null) {
    interviewCacheModelBusinessAsset.fullAddress = fullAddress;
  }
  final String? purchaseTime = jsonConvert.convert<String>(json['purchase_time']);
  if (purchaseTime != null) {
    interviewCacheModelBusinessAsset.purchaseTime = purchaseTime;
  }
  final String? purchasePrice = jsonConvert.convert<String>(json['purchase_price']);
  if (purchasePrice != null) {
    interviewCacheModelBusinessAsset.purchasePrice = purchasePrice;
  }
  final String? marketValue = jsonConvert.convert<String>(json['market_value']);
  if (marketValue != null) {
    interviewCacheModelBusinessAsset.marketValue = marketValue;
  }
  final List<String>? photos = (json['photos'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (photos != null) {
    interviewCacheModelBusinessAsset.photos = photos;
  }
  return interviewCacheModelBusinessAsset;
}

Map<String, dynamic> $InterviewCacheModelBusinessAssetToJson(InterviewCacheModelBusinessAsset entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['hold_status'] = entity.holdStatus;
  data['location'] = entity.location;
  data['location_code'] = entity.locationCode;
  data['full_address'] = entity.fullAddress;
  data['purchase_time'] = entity.purchaseTime;
  data['purchase_price'] = entity.purchasePrice;
  data['market_value'] = entity.marketValue;
  data['photos'] = entity.photos;
  return data;
}

extension InterviewCacheModelBusinessAssetExtension on InterviewCacheModelBusinessAsset {
  InterviewCacheModelBusinessAsset copyWith({
    bool? holdStatus,
    String? location,
    String? locationCode,
    String? fullAddress,
    String? purchaseTime,
    String? purchasePrice,
    String? marketValue,
    List<String>? photos,
  }) {
    return InterviewCacheModelBusinessAsset()
      ..holdStatus = holdStatus ?? this.holdStatus
      ..location = location ?? this.location
      ..locationCode = locationCode ?? this.locationCode
      ..fullAddress = fullAddress ?? this.fullAddress
      ..purchaseTime = purchaseTime ?? this.purchaseTime
      ..purchasePrice = purchasePrice ?? this.purchasePrice
      ..marketValue = marketValue ?? this.marketValue
      ..photos = photos ?? this.photos;
  }
}

InterviewCacheModelLivestockAsset $InterviewCacheModelLivestockAssetFromJson(Map<String, dynamic> json) {
  final InterviewCacheModelLivestockAsset interviewCacheModelLivestockAsset = InterviewCacheModelLivestockAsset();
  final Subcategory? assetType = jsonConvert.convert<Subcategory>(json['asset_type']);
  if (assetType != null) {
    interviewCacheModelLivestockAsset.assetType = assetType;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    interviewCacheModelLivestockAsset.amount = amount;
  }
  final String? estimatedUnitPrice = jsonConvert.convert<String>(json['estimated_unit_price']);
  if (estimatedUnitPrice != null) {
    interviewCacheModelLivestockAsset.estimatedUnitPrice = estimatedUnitPrice;
  }
  final String? totalMarketValue = jsonConvert.convert<String>(json['total_market_value']);
  if (totalMarketValue != null) {
    interviewCacheModelLivestockAsset.totalMarketValue = totalMarketValue;
  }
  final List<String>? photos = (json['photos'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (photos != null) {
    interviewCacheModelLivestockAsset.photos = photos;
  }
  return interviewCacheModelLivestockAsset;
}

Map<String, dynamic> $InterviewCacheModelLivestockAssetToJson(InterviewCacheModelLivestockAsset entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['asset_type'] = entity.assetType?.toJson();
  data['amount'] = entity.amount;
  data['estimated_unit_price'] = entity.estimatedUnitPrice;
  data['total_market_value'] = entity.totalMarketValue;
  data['photos'] = entity.photos;
  return data;
}

extension InterviewCacheModelLivestockAssetExtension on InterviewCacheModelLivestockAsset {
  InterviewCacheModelLivestockAsset copyWith({
    Subcategory? assetType,
    String? amount,
    String? estimatedUnitPrice,
    String? totalMarketValue,
    List<String>? photos,
  }) {
    return InterviewCacheModelLivestockAsset()
      ..assetType = assetType ?? this.assetType
      ..amount = amount ?? this.amount
      ..estimatedUnitPrice = estimatedUnitPrice ?? this.estimatedUnitPrice
      ..totalMarketValue = totalMarketValue ?? this.totalMarketValue
      ..photos = photos ?? this.photos;
  }
}

InterviewCacheModelVehicle $InterviewCacheModelVehicleFromJson(Map<String, dynamic> json) {
  final InterviewCacheModelVehicle interviewCacheModelVehicle = InterviewCacheModelVehicle();
  final Subcategory? vehicleType = jsonConvert.convert<Subcategory>(json['vehicle_type']);
  if (vehicleType != null) {
    interviewCacheModelVehicle.vehicleType = vehicleType;
  }
  final String? purchasePrice = jsonConvert.convert<String>(json['purchase_price']);
  if (purchasePrice != null) {
    interviewCacheModelVehicle.purchasePrice = purchasePrice;
  }
  final String? purchaseDate = jsonConvert.convert<String>(json['purchase_date']);
  if (purchaseDate != null) {
    interviewCacheModelVehicle.purchaseDate = purchaseDate;
  }
  final String? marketValue = jsonConvert.convert<String>(json['market_value']);
  if (marketValue != null) {
    interviewCacheModelVehicle.marketValue = marketValue;
  }
  final List<String>? photos = (json['photos'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (photos != null) {
    interviewCacheModelVehicle.photos = photos;
  }
  return interviewCacheModelVehicle;
}

Map<String, dynamic> $InterviewCacheModelVehicleToJson(InterviewCacheModelVehicle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['vehicle_type'] = entity.vehicleType?.toJson();
  data['purchase_price'] = entity.purchasePrice;
  data['purchase_date'] = entity.purchaseDate;
  data['market_value'] = entity.marketValue;
  data['photos'] = entity.photos;
  return data;
}

extension InterviewCacheModelVehicleExtension on InterviewCacheModelVehicle {
  InterviewCacheModelVehicle copyWith({
    Subcategory? vehicleType,
    String? purchasePrice,
    String? purchaseDate,
    String? marketValue,
    List<String>? photos,
  }) {
    return InterviewCacheModelVehicle()
      ..vehicleType = vehicleType ?? this.vehicleType
      ..purchasePrice = purchasePrice ?? this.purchasePrice
      ..purchaseDate = purchaseDate ?? this.purchaseDate
      ..marketValue = marketValue ?? this.marketValue
      ..photos = photos ?? this.photos;
  }
}

InterviewCacheModelOtherSupportingMaterials $InterviewCacheModelOtherSupportingMaterialsFromJson(Map<String, dynamic> json) {
  final InterviewCacheModelOtherSupportingMaterials interviewCacheModelOtherSupportingMaterials = InterviewCacheModelOtherSupportingMaterials();
  final String? addition = jsonConvert.convert<String>(json['addition']);
  if (addition != null) {
    interviewCacheModelOtherSupportingMaterials.addition = addition;
  }
  final List<String>? photos = (json['photos'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (photos != null) {
    interviewCacheModelOtherSupportingMaterials.photos = photos;
  }
  return interviewCacheModelOtherSupportingMaterials;
}

Map<String, dynamic> $InterviewCacheModelOtherSupportingMaterialsToJson(InterviewCacheModelOtherSupportingMaterials entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['addition'] = entity.addition;
  data['photos'] = entity.photos;
  return data;
}

extension InterviewCacheModelOtherSupportingMaterialsExtension on InterviewCacheModelOtherSupportingMaterials {
  InterviewCacheModelOtherSupportingMaterials copyWith({
    String? addition,
    List<String>? photos,
  }) {
    return InterviewCacheModelOtherSupportingMaterials()
      ..addition = addition ?? this.addition
      ..photos = photos ?? this.photos;
  }
}

InterviewCacheModelRefuseLoanInfo $InterviewCacheModelRefuseLoanInfoFromJson(Map<String, dynamic> json) {
  final InterviewCacheModelRefuseLoanInfo interviewCacheModelRefuseLoanInfo = InterviewCacheModelRefuseLoanInfo();
  final bool? status = jsonConvert.convert<bool>(json['status']);
  if (status != null) {
    interviewCacheModelRefuseLoanInfo.status = status;
  }
  final String? recommend = jsonConvert.convert<String>(json['recommend']);
  if (recommend != null) {
    interviewCacheModelRefuseLoanInfo.recommend = recommend;
  }
  return interviewCacheModelRefuseLoanInfo;
}

Map<String, dynamic> $InterviewCacheModelRefuseLoanInfoToJson(InterviewCacheModelRefuseLoanInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['recommend'] = entity.recommend;
  return data;
}

extension InterviewCacheModelRefuseLoanInfoExtension on InterviewCacheModelRefuseLoanInfo {
  InterviewCacheModelRefuseLoanInfo copyWith({
    bool? status,
    String? recommend,
  }) {
    return InterviewCacheModelRefuseLoanInfo()
      ..status = status ?? this.status
      ..recommend = recommend ?? this.recommend;
  }
}
