import 'package:investigators/generated/json/base/json_field.dart';
import 'dart:convert';

import '../generated/json/interview_detail_info.g.dart';

@JsonSerializable()
class InterviewDetailInfo {
	@JSONField(name: "interview_info")
	late InterviewDetailInfoInterviewInfo interviewInfo;
	@JSONField(name: "client_info")
	late InterviewDetailInfoClientInfo clientInfo;

	InterviewDetailInfo();

	factory InterviewDetailInfo.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfo {
	late String name;
	late List<InterviewDetailInfoInterviewInfoAddress> address;
	late InterviewDetailInfoInterviewInfoAsset asset;
	List<InterviewDetailInfoInterviewInfoAccount>? account;

	InterviewDetailInfoInterviewInfo();

	factory InterviewDetailInfoInterviewInfo.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfoAddress {
	@JSONField(name: "province_code")
	late String provinceCode;
	@JSONField(name: "city_code")
	late String cityCode;
	@JSONField(name: "barangay_code")
	late String barangayCode;
	@JSONField(name: "full_address")
	late String fullAddress;
	late String type;

	InterviewDetailInfoInterviewInfoAddress();

	factory InterviewDetailInfoInterviewInfoAddress.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoAddressFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoAddressToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfoAsset {
	@JSONField(name: "monthly_income")
	 InterviewDetailInfoInterviewInfoAssetMonthlyIncome? monthlyIncome;
	@JSONField(name: "last_month_transaction_flow")
	InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow? lastMonthTransactionFlow;
	@JSONField(name: "investment_certificate")
	InterviewDetailInfoInterviewInfoAssetInvestmentCertificate? investmentCertificate;
	@JSONField(name: "proof_of_employment")
	InterviewDetailInfoInterviewInfoAssetProofOfEmployment? proofOfEmployment;
	@JSONField(name: "other_assets")
	InterviewDetailInfoInterviewInfoAssetOtherAssets? otherAssets;
	@JSONField(name: "land_ownership")
	InterviewDetailInfoInterviewInfoAssetLandOwnership? landOwnership;
	@JSONField(name: "house_ownership")
	InterviewDetailInfoInterviewInfoAssetHouseOwnership? houseOwnership;
	@JSONField(name: "shop_assets")
	InterviewDetailInfoInterviewInfoAssetShopAssets? shopAssets;
	@JSONField(name: "livestock_assets")
	InterviewDetailInfoInterviewInfoAssetLivestockAssets? livestockAssets;
	@JSONField(name: "motor_vehicles")
	InterviewDetailInfoInterviewInfoAssetMotorVehicles? motorVehicles;

	InterviewDetailInfoInterviewInfoAsset();

	factory InterviewDetailInfoInterviewInfoAsset.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoAssetFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoAssetToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfoAssetMonthlyIncome {
	@JSONField(name: "cate_id")
	late String cateId;
	late List<String> imgs;
	late String addition;

	InterviewDetailInfoInterviewInfoAssetMonthlyIncome();

	factory InterviewDetailInfoInterviewInfoAssetMonthlyIncome.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoAssetMonthlyIncomeFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoAssetMonthlyIncomeToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow {
	@JSONField(name: "cate_id")
	late String cateId;
	late List<String> imgs;
	late String addition;

	InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow();

	factory InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlowFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlowToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfoAssetInvestmentCertificate {
	@JSONField(name: "cate_id")
	late String cateId;
	late List<String> imgs;
	late String addition;

	InterviewDetailInfoInterviewInfoAssetInvestmentCertificate();

	factory InterviewDetailInfoInterviewInfoAssetInvestmentCertificate.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoAssetInvestmentCertificateFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoAssetInvestmentCertificateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfoAssetProofOfEmployment {
	@JSONField(name: "cate_id")
	late String cateId;
	late List<String> imgs;
	late String addition;

	InterviewDetailInfoInterviewInfoAssetProofOfEmployment();

	factory InterviewDetailInfoInterviewInfoAssetProofOfEmployment.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoAssetProofOfEmploymentFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoAssetProofOfEmploymentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfoAssetOtherAssets {
	@JSONField(name: "cate_id")
	late String cateId;
	late List<String> imgs;
	late String addition;

	InterviewDetailInfoInterviewInfoAssetOtherAssets();

	factory InterviewDetailInfoInterviewInfoAssetOtherAssets.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoAssetOtherAssetsFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoAssetOtherAssetsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfoAssetLandOwnership {
	@JSONField(name: "cate_id")
	late String cateId;
	late List<String> imgs;
	late String addition;

	InterviewDetailInfoInterviewInfoAssetLandOwnership();

	factory InterviewDetailInfoInterviewInfoAssetLandOwnership.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoAssetLandOwnershipFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoAssetLandOwnershipToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfoAssetHouseOwnership {
	@JSONField(name: "cate_id")
	late String cateId;
	late List<String> imgs;
	late String addition;

	InterviewDetailInfoInterviewInfoAssetHouseOwnership();

	factory InterviewDetailInfoInterviewInfoAssetHouseOwnership.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoAssetHouseOwnershipFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoAssetHouseOwnershipToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfoAssetShopAssets {
	@JSONField(name: "cate_id")
	late String cateId;
	late List<String> imgs;
	late String addition;

	InterviewDetailInfoInterviewInfoAssetShopAssets();

	factory InterviewDetailInfoInterviewInfoAssetShopAssets.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoAssetShopAssetsFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoAssetShopAssetsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfoAssetLivestockAssets {
	@JSONField(name: "cate_id")
	late String cateId;
	late List<String> imgs;
	late String addition;

	InterviewDetailInfoInterviewInfoAssetLivestockAssets();

	factory InterviewDetailInfoInterviewInfoAssetLivestockAssets.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoAssetLivestockAssetsFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoAssetLivestockAssetsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfoAssetMotorVehicles {
	@JSONField(name: "cate_id")
	late String cateId;
	late List<String> imgs;
	late String addition;

	InterviewDetailInfoInterviewInfoAssetMotorVehicles();

	factory InterviewDetailInfoInterviewInfoAssetMotorVehicles.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoAssetMotorVehiclesFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoAssetMotorVehiclesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoInterviewInfoAccount {
	@JSONField(name: "withdraw_relation")
	late String withdrawRelation;
	@JSONField(name: "account_no")
	late String accountNo;
	@JSONField(name: "account_holder")
	late String accountHolder;
	@JSONField(name: "channel_name")
	late String channelName;
	@JSONField(name: "withdraw_type")
	late String withdrawType;
	@JSONField(name: 'is_choose')
	late String isChoose;

	InterviewDetailInfoInterviewInfoAccount();

	factory InterviewDetailInfoInterviewInfoAccount.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoInterviewInfoAccountFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoInterviewInfoAccountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoClientInfo {
	late InterviewDetailInfoClientInfoCredit credit;
	late InterviewDetailInfoClientInfoPhotos photos;
	@JSONField(name: "base_info")
	late InterviewDetailInfoClientInfoBaseInfo baseInfo;

	InterviewDetailInfoClientInfo();

	factory InterviewDetailInfoClientInfo.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoClientInfoFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoClientInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoClientInfoCredit {
	late String amount;
	@JSONField(name: "ins_num")
	late String insNum;
	@JSONField(name: "loan_days")
	late String loanDays;
	late String pid;
	late String token;
	late String rid;

	InterviewDetailInfoClientInfoCredit();

	factory InterviewDetailInfoClientInfoCredit.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoClientInfoCreditFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoClientInfoCreditToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoClientInfoPhotos {
	@JSONField(name: "activity_photo")
	late String activityPhoto;
	@JSONField(name: "identify_photo")
	late String identifyPhoto;
	@JSONField(name: "identity_type")
	late String identityType;

	InterviewDetailInfoClientInfoPhotos();

	factory InterviewDetailInfoClientInfoPhotos.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoClientInfoPhotosFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoClientInfoPhotosToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InterviewDetailInfoClientInfoBaseInfo {
	late String name;
	late String gender;
	late String birthday;
	@JSONField(name: "id_card_number")
	late String idCardNumber;
	@JSONField(name: "education_background")
	late String educationBackground;
	@JSONField(name: "marital_status")
	late String maritalStatus;
	@JSONField(name: "number_of_children")
	late String numberOfChildren;
	@JSONField(name: "usage_of_loan")
	late String usageOfLoan;
	@JSONField(name: "industry_category")
	late String industryCategory;
	@JSONField(name: "monthly_income")
	late String monthlyIncome;
	@JSONField(name: "working_experience")
	late String workingExperience;
	late String payday;
	@JSONField(name: "residential_ownership")
	late String residentialOwnership;
	@JSONField(name: "company_name")
	late String companyName;
	@JSONField(name: "facebook_link")
	late String facebookLink;
	@JSONField(name: "client_tel")
	late String clientTel;
	@JSONField(name: "alter_phone")
	late String alterPhone;
	@JSONField(name: "viber_phone")
	late String viberPhone;
	late String email;

	InterviewDetailInfoClientInfoBaseInfo();

	factory InterviewDetailInfoClientInfoBaseInfo.fromJson(Map<String, dynamic> json) => $InterviewDetailInfoClientInfoBaseInfoFromJson(json);

	Map<String, dynamic> toJson() => $InterviewDetailInfoClientInfoBaseInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}