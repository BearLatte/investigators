import 'package:investigators/generated/json/base/json_convert_content.dart';
import 'package:investigators/models/appointment_pending_list.dart';
import 'package:investigators/models/address_model.dart';


AppointmentPendingList $AppointmentPendingListFromJson(Map<String, dynamic> json) {
  final AppointmentPendingList appointmentPendingList = AppointmentPendingList();
  final String? total = jsonConvert.convert<String>(json['total']);
  if (total != null) {
    appointmentPendingList.total = total;
  }
  final String? perPage = jsonConvert.convert<String>(json['per_page']);
  if (perPage != null) {
    appointmentPendingList.perPage = perPage;
  }
  final String? currentPage = jsonConvert.convert<String>(json['current_page']);
  if (currentPage != null) {
    appointmentPendingList.currentPage = currentPage;
  }
  final String? lastPage = jsonConvert.convert<String>(json['last_page']);
  if (lastPage != null) {
    appointmentPendingList.lastPage = lastPage;
  }
  final List<AppointmentPendingListData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<AppointmentPendingListData>(e) as AppointmentPendingListData).toList();
  if (data != null) {
    appointmentPendingList.data = data;
  }
  return appointmentPendingList;
}

Map<String, dynamic> $AppointmentPendingListToJson(AppointmentPendingList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['total'] = entity.total;
  data['per_page'] = entity.perPage;
  data['current_page'] = entity.currentPage;
  data['last_page'] = entity.lastPage;
  data['data'] = entity.data.map((v) => v.toJson()).toList();
  return data;
}

extension AppointmentPendingListExtension on AppointmentPendingList {
  AppointmentPendingList copyWith({
    String? total,
    String? perPage,
    String? currentPage,
    String? lastPage,
    List<AppointmentPendingListData>? data,
  }) {
    return AppointmentPendingList()
      ..total = total ?? this.total
      ..perPage = perPage ?? this.perPage
      ..currentPage = currentPage ?? this.currentPage
      ..lastPage = lastPage ?? this.lastPage
      ..data = data ?? this.data;
  }
}

AppointmentPendingListData $AppointmentPendingListDataFromJson(Map<String, dynamic> json) {
  final AppointmentPendingListData appointmentPendingListData = AppointmentPendingListData();
  final String? signRecordId = jsonConvert.convert<String>(json['sign_record_id']);
  if (signRecordId != null) {
    appointmentPendingListData.signRecordId = signRecordId;
  }
  final String? applyId = jsonConvert.convert<String>(json['apply_id']);
  if (applyId != null) {
    appointmentPendingListData.applyId = applyId;
  }
  final String? clientId = jsonConvert.convert<String>(json['client_id']);
  if (clientId != null) {
    appointmentPendingListData.clientId = clientId;
  }
  final String? productName = jsonConvert.convert<String>(json['product_name']);
  if (productName != null) {
    appointmentPendingListData.productName = productName;
  }
  final String? clientTel = jsonConvert.convert<String>(json['client_tel']);
  if (clientTel != null) {
    appointmentPendingListData.clientTel = clientTel;
  }
  final String? remainTime = jsonConvert.convert<String>(json['remain_time']);
  if (remainTime != null) {
    appointmentPendingListData.remainTime = remainTime;
  }
  final String? approveAmount = jsonConvert.convert<String>(json['approve_amount']);
  if (approveAmount != null) {
    appointmentPendingListData.approveAmount = approveAmount;
  }
  final AppointmentPendingListDataIdentityInfo? identityInfo = jsonConvert.convert<AppointmentPendingListDataIdentityInfo>(json['identity_info']);
  if (identityInfo != null) {
    appointmentPendingListData.identityInfo = identityInfo;
  }
  final List<AddressModel>? addressInfo = (json['address_info'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<AddressModel>(e) as AddressModel).toList();
  if (addressInfo != null) {
    appointmentPendingListData.addressInfo = addressInfo;
  }
  return appointmentPendingListData;
}

Map<String, dynamic> $AppointmentPendingListDataToJson(AppointmentPendingListData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign_record_id'] = entity.signRecordId;
  data['apply_id'] = entity.applyId;
  data['client_id'] = entity.clientId;
  data['product_name'] = entity.productName;
  data['client_tel'] = entity.clientTel;
  data['remain_time'] = entity.remainTime;
  data['approve_amount'] = entity.approveAmount;
  data['identity_info'] = entity.identityInfo.toJson();
  data['address_info'] = entity.addressInfo.map((v) => v.toJson()).toList();
  return data;
}

extension AppointmentPendingListDataExtension on AppointmentPendingListData {
  AppointmentPendingListData copyWith({
    String? signRecordId,
    String? applyId,
    String? clientId,
    String? productName,
    String? clientTel,
    String? remainTime,
    String? approveAmount,
    AppointmentPendingListDataIdentityInfo? identityInfo,
    List<AddressModel>? addressInfo,
  }) {
    return AppointmentPendingListData()
      ..signRecordId = signRecordId ?? this.signRecordId
      ..applyId = applyId ?? this.applyId
      ..clientId = clientId ?? this.clientId
      ..productName = productName ?? this.productName
      ..clientTel = clientTel ?? this.clientTel
      ..remainTime = remainTime ?? this.remainTime
      ..approveAmount = approveAmount ?? this.approveAmount
      ..identityInfo = identityInfo ?? this.identityInfo
      ..addressInfo = addressInfo ?? this.addressInfo;
  }
}

AppointmentPendingListDataIdentityInfo $AppointmentPendingListDataIdentityInfoFromJson(Map<String, dynamic> json) {
  final AppointmentPendingListDataIdentityInfo appointmentPendingListDataIdentityInfo = AppointmentPendingListDataIdentityInfo();
  final String? gender = jsonConvert.convert<String>(json['gender']);
  if (gender != null) {
    appointmentPendingListDataIdentityInfo.gender = gender;
  }
  final String? fullName = jsonConvert.convert<String>(json['full_name']);
  if (fullName != null) {
    appointmentPendingListDataIdentityInfo.fullName = fullName;
  }
  final String? clientId = jsonConvert.convert<String>(json['client_id']);
  if (clientId != null) {
    appointmentPendingListDataIdentityInfo.clientId = clientId;
  }
  return appointmentPendingListDataIdentityInfo;
}

Map<String, dynamic> $AppointmentPendingListDataIdentityInfoToJson(AppointmentPendingListDataIdentityInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gender'] = entity.gender;
  data['full_name'] = entity.fullName;
  data['client_id'] = entity.clientId;
  return data;
}

extension AppointmentPendingListDataIdentityInfoExtension on AppointmentPendingListDataIdentityInfo {
  AppointmentPendingListDataIdentityInfo copyWith({
    String? gender,
    String? fullName,
    String? clientId,
  }) {
    return AppointmentPendingListDataIdentityInfo()
      ..gender = gender ?? this.gender
      ..fullName = fullName ?? this.fullName
      ..clientId = clientId ?? this.clientId;
  }
}