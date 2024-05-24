import 'package:investigators/generated/json/base/json_field.dart';
import 'dart:convert';

import '../generated/json/returned_list.g.dart';

@JsonSerializable()
class ReturnedList {
  late String total;
  @JSONField(name: "per_page")
  late String perPage;
  @JSONField(name: "current_page")
  late String currentPage;
  @JSONField(name: "last_page")
  late String lastPage;
  late List<ReturnedListData> data;

  ReturnedList();

  factory ReturnedList.fromJson(Map<String, dynamic> json) => $ReturnedListFromJson(json);

  Map<String, dynamic> toJson() => $ReturnedListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ReturnedListData {
  @JSONField(name: "sign_record_id")
  late String signRecordId;
  @JSONField(name: "apply_id")
  late String applyId;
  @JSONField(name: "client_id")
  late String clientId;
  @JSONField(name: "approve_ins_num")
  late String approveInsNum;
  @JSONField(name: "booking_time")
  late String bookingTime;
  @JSONField(name: "cancel_reason")
  late String cancelReason;
  @JSONField(name: "product_name")
  late String productName;
  @JSONField(name: "client_tel")
  late String clientTel;
  @JSONField(name: "approve_amount")
  late String approveAmount;
  @JSONField(name: "identity_info")
  late ReturnedListDataIdentityInfo identityInfo;

  ReturnedListData();

  factory ReturnedListData.fromJson(Map<String, dynamic> json) => $ReturnedListDataFromJson(json);

  Map<String, dynamic> toJson() => $ReturnedListDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ReturnedListDataIdentityInfo {
  late String gender;
  @JSONField(name: "full_name")
  late String fullName;
  @JSONField(name: "client_id")
  late String clientId;

  ReturnedListDataIdentityInfo();

  factory ReturnedListDataIdentityInfo.fromJson(Map<String, dynamic> json) => $ReturnedListDataIdentityInfoFromJson(json);

  Map<String, dynamic> toJson() => $ReturnedListDataIdentityInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
