import 'package:investigators/generated/json/base/json_convert_content.dart';
import 'package:investigators/models/interview_pending_list.dart';
import 'package:investigators/models/address_model.dart';


InterviewPendingList $InterviewPendingListFromJson(Map<String, dynamic> json) {
  final InterviewPendingList interviewPendingList = InterviewPendingList();
  final String? total = jsonConvert.convert<String>(json['total']);
  if (total != null) {
    interviewPendingList.total = total;
  }
  final String? perPage = jsonConvert.convert<String>(json['per_page']);
  if (perPage != null) {
    interviewPendingList.perPage = perPage;
  }
  final String? currentPage = jsonConvert.convert<String>(json['current_page']);
  if (currentPage != null) {
    interviewPendingList.currentPage = currentPage;
  }
  final String? lastPage = jsonConvert.convert<String>(json['last_page']);
  if (lastPage != null) {
    interviewPendingList.lastPage = lastPage;
  }
  final List<InterviewPendingListData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<InterviewPendingListData>(e) as InterviewPendingListData).toList();
  if (data != null) {
    interviewPendingList.data = data;
  }
  return interviewPendingList;
}

Map<String, dynamic> $InterviewPendingListToJson(InterviewPendingList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['total'] = entity.total;
  data['per_page'] = entity.perPage;
  data['current_page'] = entity.currentPage;
  data['last_page'] = entity.lastPage;
  data['data'] = entity.data.map((v) => v.toJson()).toList();
  return data;
}

extension InterviewPendingListExtension on InterviewPendingList {
  InterviewPendingList copyWith({
    String? total,
    String? perPage,
    String? currentPage,
    String? lastPage,
    List<InterviewPendingListData>? data,
  }) {
    return InterviewPendingList()
      ..total = total ?? this.total
      ..perPage = perPage ?? this.perPage
      ..currentPage = currentPage ?? this.currentPage
      ..lastPage = lastPage ?? this.lastPage
      ..data = data ?? this.data;
  }
}

InterviewPendingListData $InterviewPendingListDataFromJson(Map<String, dynamic> json) {
  final InterviewPendingListData interviewPendingListData = InterviewPendingListData();
  final String? signRecordId = jsonConvert.convert<String>(json['sign_record_id']);
  if (signRecordId != null) {
    interviewPendingListData.signRecordId = signRecordId;
  }
  final String? applyId = jsonConvert.convert<String>(json['apply_id']);
  if (applyId != null) {
    interviewPendingListData.applyId = applyId;
  }
  final String? clientId = jsonConvert.convert<String>(json['client_id']);
  if (clientId != null) {
    interviewPendingListData.clientId = clientId;
  }
  final String? bookingTime = jsonConvert.convert<String>(json['booking_time']);
  if (bookingTime != null) {
    interviewPendingListData.bookingTime = bookingTime;
  }
  final String? productName = jsonConvert.convert<String>(json['product_name']);
  if (productName != null) {
    interviewPendingListData.productName = productName;
  }
  final String? clientTel = jsonConvert.convert<String>(json['client_tel']);
  if (clientTel != null) {
    interviewPendingListData.clientTel = clientTel;
  }
  final String? remainTime = jsonConvert.convert<String>(json['remain_time']);
  if (remainTime != null) {
    interviewPendingListData.remainTime = remainTime;
  }
  final String? approveAmount = jsonConvert.convert<String>(json['approve_amount']);
  if (approveAmount != null) {
    interviewPendingListData.approveAmount = approveAmount;
  }
  final InterviewPendingListDataIdentityInfo? identityInfo = jsonConvert.convert<InterviewPendingListDataIdentityInfo>(json['identity_info']);
  if (identityInfo != null) {
    interviewPendingListData.identityInfo = identityInfo;
  }
  final List<AddressModel>? addressInfo = (json['address_info'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<AddressModel>(e) as AddressModel).toList();
  if (addressInfo != null) {
    interviewPendingListData.addressInfo = addressInfo;
  }
  final String? bookingAddress = jsonConvert.convert<String>(json['booking_address']);
  if (bookingAddress != null) {
    interviewPendingListData.bookingAddress = bookingAddress;
  }
  return interviewPendingListData;
}

Map<String, dynamic> $InterviewPendingListDataToJson(InterviewPendingListData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign_record_id'] = entity.signRecordId;
  data['apply_id'] = entity.applyId;
  data['client_id'] = entity.clientId;
  data['booking_time'] = entity.bookingTime;
  data['product_name'] = entity.productName;
  data['client_tel'] = entity.clientTel;
  data['remain_time'] = entity.remainTime;
  data['approve_amount'] = entity.approveAmount;
  data['identity_info'] = entity.identityInfo.toJson();
  data['address_info'] = entity.addressInfo.map((v) => v.toJson()).toList();
  data['booking_address'] = entity.bookingAddress;
  return data;
}

extension InterviewPendingListDataExtension on InterviewPendingListData {
  InterviewPendingListData copyWith({
    String? signRecordId,
    String? applyId,
    String? clientId,
    String? bookingTime,
    String? productName,
    String? clientTel,
    String? remainTime,
    String? approveAmount,
    InterviewPendingListDataIdentityInfo? identityInfo,
    List<AddressModel>? addressInfo,
    String? bookingAddress,
  }) {
    return InterviewPendingListData()
      ..signRecordId = signRecordId ?? this.signRecordId
      ..applyId = applyId ?? this.applyId
      ..clientId = clientId ?? this.clientId
      ..bookingTime = bookingTime ?? this.bookingTime
      ..productName = productName ?? this.productName
      ..clientTel = clientTel ?? this.clientTel
      ..remainTime = remainTime ?? this.remainTime
      ..approveAmount = approveAmount ?? this.approveAmount
      ..identityInfo = identityInfo ?? this.identityInfo
      ..addressInfo = addressInfo ?? this.addressInfo
      ..bookingAddress = bookingAddress ?? this.bookingAddress;
  }
}

InterviewPendingListDataIdentityInfo $InterviewPendingListDataIdentityInfoFromJson(Map<String, dynamic> json) {
  final InterviewPendingListDataIdentityInfo interviewPendingListDataIdentityInfo = InterviewPendingListDataIdentityInfo();
  final String? gender = jsonConvert.convert<String>(json['gender']);
  if (gender != null) {
    interviewPendingListDataIdentityInfo.gender = gender;
  }
  final String? fullName = jsonConvert.convert<String>(json['full_name']);
  if (fullName != null) {
    interviewPendingListDataIdentityInfo.fullName = fullName;
  }
  final String? clientId = jsonConvert.convert<String>(json['client_id']);
  if (clientId != null) {
    interviewPendingListDataIdentityInfo.clientId = clientId;
  }
  return interviewPendingListDataIdentityInfo;
}

Map<String, dynamic> $InterviewPendingListDataIdentityInfoToJson(InterviewPendingListDataIdentityInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gender'] = entity.gender;
  data['full_name'] = entity.fullName;
  data['client_id'] = entity.clientId;
  return data;
}

extension InterviewPendingListDataIdentityInfoExtension on InterviewPendingListDataIdentityInfo {
  InterviewPendingListDataIdentityInfo copyWith({
    String? gender,
    String? fullName,
    String? clientId,
  }) {
    return InterviewPendingListDataIdentityInfo()
      ..gender = gender ?? this.gender
      ..fullName = fullName ?? this.fullName
      ..clientId = clientId ?? this.clientId;
  }
}