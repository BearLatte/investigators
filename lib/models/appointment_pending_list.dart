import 'package:investigators/generated/json/base/json_field.dart';
import 'dart:convert';

import '../generated/json/appointment_pending_list.g.dart';

@JsonSerializable()
class AppointmentPendingList {
	late String total;
	@JSONField(name: "per_page")
	late String perPage;
	@JSONField(name: "current_page")
	late String currentPage;
	@JSONField(name: "last_page")
	late String lastPage;
	late List<AppointmentPendingListData> data;

	AppointmentPendingList();

	factory AppointmentPendingList.fromJson(Map<String, dynamic> json) => $AppointmentPendingListFromJson(json);

	Map<String, dynamic> toJson() => $AppointmentPendingListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AppointmentPendingListData {
	@JSONField(name: "sign_record_id")
	late String signRecordId;
	@JSONField(name: "apply_id")
	late String applyId;
	@JSONField(name: "client_id")
	late String clientId;
	@JSONField(name: "product_name")
	late String productName;
	@JSONField(name: "client_tel")
	late String clientTel;
	@JSONField(name: "remain_time")
	late String remainTime;
	@JSONField(name: "approve_amount")
	late String approveAmount;
	@JSONField(name: "identity_info")
	late AppointmentPendingListDataIdentityInfo identityInfo;
	@JSONField(name: "address_info")
	late List<AppointmentPendingListDataAddressInfo> addressInfo;

	AppointmentPendingListData();

	factory AppointmentPendingListData.fromJson(Map<String, dynamic> json) => $AppointmentPendingListDataFromJson(json);

	Map<String, dynamic> toJson() => $AppointmentPendingListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AppointmentPendingListDataIdentityInfo {
	late String gender;
	@JSONField(name: "full_name")
	late String fullName;
	@JSONField(name: "client_id")
	late String clientId;

	AppointmentPendingListDataIdentityInfo();

	factory AppointmentPendingListDataIdentityInfo.fromJson(Map<String, dynamic> json) => $AppointmentPendingListDataIdentityInfoFromJson(json);

	Map<String, dynamic> toJson() => $AppointmentPendingListDataIdentityInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AppointmentPendingListDataAddressInfo {
	@JSONField(name: "address_id")
	late String addressId;
	@JSONField(name: "full_address")
	late String fullAddress;
	late String type;
	@JSONField(name: "client_id")
	late String clientId;

	AppointmentPendingListDataAddressInfo();

	factory AppointmentPendingListDataAddressInfo.fromJson(Map<String, dynamic> json) => $AppointmentPendingListDataAddressInfoFromJson(json);

	Map<String, dynamic> toJson() => $AppointmentPendingListDataAddressInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}