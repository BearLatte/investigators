import 'package:investigators/generated/json/base/json_convert_content.dart';
import 'package:investigators/models/returned_list.dart';

ReturnedList $ReturnedListFromJson(Map<String, dynamic> json) {
  final ReturnedList returnedList = ReturnedList();
  final String? total = jsonConvert.convert<String>(json['total']);
  if (total != null) {
    returnedList.total = total;
  }
  final String? perPage = jsonConvert.convert<String>(json['per_page']);
  if (perPage != null) {
    returnedList.perPage = perPage;
  }
  final String? currentPage = jsonConvert.convert<String>(json['current_page']);
  if (currentPage != null) {
    returnedList.currentPage = currentPage;
  }
  final String? lastPage = jsonConvert.convert<String>(json['last_page']);
  if (lastPage != null) {
    returnedList.lastPage = lastPage;
  }
  final List<ReturnedListData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<ReturnedListData>(e) as ReturnedListData).toList();
  if (data != null) {
    returnedList.data = data;
  }
  return returnedList;
}

Map<String, dynamic> $ReturnedListToJson(ReturnedList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['total'] = entity.total;
  data['per_page'] = entity.perPage;
  data['current_page'] = entity.currentPage;
  data['last_page'] = entity.lastPage;
  data['data'] = entity.data.map((v) => v.toJson()).toList();
  return data;
}

extension ReturnedListExtension on ReturnedList {
  ReturnedList copyWith({
    String? total,
    String? perPage,
    String? currentPage,
    String? lastPage,
    List<ReturnedListData>? data,
  }) {
    return ReturnedList()
      ..total = total ?? this.total
      ..perPage = perPage ?? this.perPage
      ..currentPage = currentPage ?? this.currentPage
      ..lastPage = lastPage ?? this.lastPage
      ..data = data ?? this.data;
  }
}

ReturnedListData $ReturnedListDataFromJson(Map<String, dynamic> json) {
  final ReturnedListData returnedListData = ReturnedListData();
  final String? signRecordId = jsonConvert.convert<String>(json['sign_record_id']);
  if (signRecordId != null) {
    returnedListData.signRecordId = signRecordId;
  }
  final String? applyId = jsonConvert.convert<String>(json['apply_id']);
  if (applyId != null) {
    returnedListData.applyId = applyId;
  }
  final String? clientId = jsonConvert.convert<String>(json['client_id']);
  if (clientId != null) {
    returnedListData.clientId = clientId;
  }
  final String? approveInsNum = jsonConvert.convert<String>(json['approve_ins_num']);
  if (approveInsNum != null) {
    returnedListData.approveInsNum = approveInsNum;
  }
  final String? bookingTime = jsonConvert.convert<String>(json['booking_time']);
  if (bookingTime != null) {
    returnedListData.bookingTime = bookingTime;
  }
  final String? cancelReason = jsonConvert.convert<String>(json['cancel_reason']);
  if (cancelReason != null) {
    returnedListData.cancelReason = cancelReason;
  }
  final String? productName = jsonConvert.convert<String>(json['product_name']);
  if (productName != null) {
    returnedListData.productName = productName;
  }
  final String? clientTel = jsonConvert.convert<String>(json['client_tel']);
  if (clientTel != null) {
    returnedListData.clientTel = clientTel;
  }
  final String? approveAmount = jsonConvert.convert<String>(json['approve_amount']);
  if (approveAmount != null) {
    returnedListData.approveAmount = approveAmount;
  }
  final ReturnedListDataIdentityInfo? identityInfo = jsonConvert.convert<ReturnedListDataIdentityInfo>(json['identity_info']);
  if (identityInfo != null) {
    returnedListData.identityInfo = identityInfo;
  }
  return returnedListData;
}

Map<String, dynamic> $ReturnedListDataToJson(ReturnedListData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign_record_id'] = entity.signRecordId;
  data['apply_id'] = entity.applyId;
  data['client_id'] = entity.clientId;
  data['approve_ins_num'] = entity.approveInsNum;
  data['booking_time'] = entity.bookingTime;
  data['cancel_reason'] = entity.cancelReason;
  data['product_name'] = entity.productName;
  data['client_tel'] = entity.clientTel;
  data['approve_amount'] = entity.approveAmount;
  data['identity_info'] = entity.identityInfo.toJson();
  return data;
}

extension ReturnedListDataExtension on ReturnedListData {
  ReturnedListData copyWith({
    String? signRecordId,
    String? applyId,
    String? clientId,
    String? approveInsNum,
    String? bookingTime,
    String? cancelReason,
    String? productName,
    String? clientTel,
    String? approveAmount,
    ReturnedListDataIdentityInfo? identityInfo,
  }) {
    return ReturnedListData()
      ..signRecordId = signRecordId ?? this.signRecordId
      ..applyId = applyId ?? this.applyId
      ..clientId = clientId ?? this.clientId
      ..approveInsNum = approveInsNum ?? this.approveInsNum
      ..bookingTime = bookingTime ?? this.bookingTime
      ..cancelReason = cancelReason ?? this.cancelReason
      ..productName = productName ?? this.productName
      ..clientTel = clientTel ?? this.clientTel
      ..approveAmount = approveAmount ?? this.approveAmount
      ..identityInfo = identityInfo ?? this.identityInfo;
  }
}

ReturnedListDataIdentityInfo $ReturnedListDataIdentityInfoFromJson(Map<String, dynamic> json) {
  final ReturnedListDataIdentityInfo returnedListDataIdentityInfo = ReturnedListDataIdentityInfo();
  final String? gender = jsonConvert.convert<String>(json['gender']);
  if (gender != null) {
    returnedListDataIdentityInfo.gender = gender;
  }
  final String? fullName = jsonConvert.convert<String>(json['full_name']);
  if (fullName != null) {
    returnedListDataIdentityInfo.fullName = fullName;
  }
  final String? clientId = jsonConvert.convert<String>(json['client_id']);
  if (clientId != null) {
    returnedListDataIdentityInfo.clientId = clientId;
  }
  return returnedListDataIdentityInfo;
}

Map<String, dynamic> $ReturnedListDataIdentityInfoToJson(ReturnedListDataIdentityInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gender'] = entity.gender;
  data['full_name'] = entity.fullName;
  data['client_id'] = entity.clientId;
  return data;
}

extension ReturnedListDataIdentityInfoExtension on ReturnedListDataIdentityInfo {
  ReturnedListDataIdentityInfo copyWith({
    String? gender,
    String? fullName,
    String? clientId,
  }) {
    return ReturnedListDataIdentityInfo()
      ..gender = gender ?? this.gender
      ..fullName = fullName ?? this.fullName
      ..clientId = clientId ?? this.clientId;
  }
}