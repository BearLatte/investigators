import 'package:investigators/generated/json/base/json_field.dart';
import 'dart:convert';

import '../generated/json/interview_pending_list.g.dart';

@JsonSerializable()
class InterviewPendingList {
	late String total;
	@JSONField(name: "per_page")
	late String perPage;
	@JSONField(name: "current_page")
	late String currentPage;
	@JSONField(name: "last_page")
	late String lastPage;
	late List<InterviewPendingListData> data;

	InterviewPendingList();

	factory InterviewPendingList.fromJson(Map<String, dynamic> json) => $InterviewPendingListFromJson(json);

	Map<String, dynamic> toJson() => $InterviewPendingListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewPendingListData {
	@JSONField(name: "sign_record_id")
	late String signRecordId;
	@JSONField(name: "apply_id")
	late String applyId;
	@JSONField(name: "client_id")
	late String clientId;
	@JSONField(name: "booking_time")
	late String bookingTime;
	@JSONField(name: "product_name")
	late String productName;
	@JSONField(name: "client_tel")
	late String clientTel;
	@JSONField(name: "remain_time")
	late String remainTime;
	@JSONField(name: "approve_amount")
	late String approveAmount;
	@JSONField(name: "identity_info")
	late InterviewPendingListDataIdentityInfo identityInfo;
	@JSONField(name: "address_info")
	late InterviewPendingListDataAddressInfo addressInfo;

	InterviewPendingListData();

	factory InterviewPendingListData.fromJson(Map<String, dynamic> json) => $InterviewPendingListDataFromJson(json);

	Map<String, dynamic> toJson() => $InterviewPendingListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewPendingListDataIdentityInfo {
	late String gender;
	@JSONField(name: "full_name")
	late String fullName;
	@JSONField(name: "client_id")
	late String clientId;

	InterviewPendingListDataIdentityInfo();

	factory InterviewPendingListDataIdentityInfo.fromJson(Map<String, dynamic> json) => $InterviewPendingListDataIdentityInfoFromJson(json);

	Map<String, dynamic> toJson() => $InterviewPendingListDataIdentityInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewPendingListDataAddressInfo {
	@JSONField(name: "full_address")
	late String fullAddress;
	late String type;
	@JSONField(name: "client_id")
	late String clientId;

	InterviewPendingListDataAddressInfo();

	factory InterviewPendingListDataAddressInfo.fromJson(Map<String, dynamic> json) => $InterviewPendingListDataAddressInfoFromJson(json);

	Map<String, dynamic> toJson() => $InterviewPendingListDataAddressInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}