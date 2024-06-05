import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:investigators/common/common_bottom_sheet.dart';
import 'package:investigators/common/common_snack_bar.dart';
import 'package:investigators/models/asset_options.dart';
import 'package:investigators/models/interview_cache_model.dart';
import 'package:investigators/models/interview_detail_info.dart';
import 'package:investigators/models/last_interview_info.dart';
import 'package:investigators/models/subcategory.dart';
import 'package:investigators/network_service/index.dart';
import 'package:investigators/router/index.dart';
import 'package:investigators/utils/aliyun_oss_util.dart';
import 'package:investigators/utils/global.dart';
import 'package:investigators/utils/method_util.dart';
import 'package:scroll_datetime_picker/scroll_datetime_picker.dart';
import '../../utils/hex_color.dart';

enum PhotoUploadType { identity, salary, moneyFlows, invest, incumbency, land, residential, business, livestock, motorVehicles, other }

enum SelectionDateType { house, business, vehicle, voucherValidity }

enum LocationOnTapType { land, house, business }

enum SubmitType { interview, reconsideration }

enum SubcategoryType { salary, moneyFlow, investment, livestock, vehicle }

class InterviewDetailController extends GetxController with GetTickerProviderStateMixin {
  late InterviewDetailInfo curDetailInfo;
  List<Tab> tabs = const [Tab(text: 'Interview Information'), Tab(text: 'User Information')];
  late TabController tabController;

  int pageType = 0;

  // name 输入控制器
  TextEditingController nameController = TextEditingController();

  // 修正的 姓名输入控制器
  TextEditingController correctNameController = TextEditingController();

  // 住宅地址控制器
  TextEditingController residentialAddressController = TextEditingController();

  // 公司地址控制器
  TextEditingController companyAddressController = TextEditingController();

  // 薪水输入控制器
  TextEditingController salaryController = TextEditingController();

  // 资金流水输入控制器
  TextEditingController moneyFlowController = TextEditingController();

  // 投资凭证输入控制器
  TextEditingController investmentController = TextEditingController();

  // 投资凭证有效期输入控制器
  TextEditingController investmentDateOfDeadlineController = TextEditingController();

  // 投资金额输入控制器
  TextEditingController investmentAmountController = TextEditingController();

  // 土地位置输入控制器
  TextEditingController landLocationController = TextEditingController();

  // 土地地址输入控制器
  TextEditingController landFullAddressController = TextEditingController();

  // 土地预估面积输入控制器
  TextEditingController landEstimatedController = TextEditingController();

  // 土地市场价值输入控制器
  TextEditingController landMarketValueController = TextEditingController();

  // house 地理位置输入控制器
  TextEditingController houseLocationController = TextEditingController();

  // house 地理位置输入控制器
  TextEditingController houseFullAddressController = TextEditingController();

  // house 购买时间输入控制器
  TextEditingController housePurchaseTimeController = TextEditingController();

  // house 购买价格输入控制器
  TextEditingController housePriceController = TextEditingController();

  // house市场价值输入控制器
  TextEditingController houseMarketValueController = TextEditingController();

  // business位置输入控制器
  TextEditingController businessLocationController = TextEditingController();

  // business地址输入控制器
  TextEditingController businessFullAddressController = TextEditingController();

  // business购买时间输入控制器
  TextEditingController businessPurchaseTimeController = TextEditingController();

  // business购买价格输入控制器
  TextEditingController businessPriceController = TextEditingController();

  // business市场价值输入控制器
  TextEditingController businessMarketValueController = TextEditingController();

  // 畜牧资产输入控制器
  TextEditingController livestockController = TextEditingController();

  // 畜牧数量输入控制器
  TextEditingController livestockAmountController = TextEditingController();

  // 畜牧单价输入控制器
  TextEditingController livestockUnitPriceController = TextEditingController();

  // 畜牧市场价值输入控制器
  TextEditingController livestockTotalValueController = TextEditingController();

  // 机动车输入控制器
  TextEditingController vehicleController = TextEditingController();

  // 机动车购买价格输入控制器
  TextEditingController vehiclePurchasePriceController = TextEditingController();

  // 机动车购买时间输入控制器
  TextEditingController vehiclePurchaseDateController = TextEditingController();

  // 机动车市场价值输入控制器
  TextEditingController vehicleMarketValueController = TextEditingController();

  // 机动车市场价值输入控制器
  TextEditingController otherSupportingController = TextEditingController();

  // 建议拒贷原因输入控制器
  TextEditingController refuseLoanReasonController = TextEditingController();

  // 薪水键盘控制对象
  FocusNode salaryNode = FocusNode();

  // 流水键盘控制对象
  FocusNode moneyFlowNode = FocusNode();

  // 投资键盘控制对象
  FocusNode investmentNode = FocusNode();

  // 畜牧资产键盘控制对象
  FocusNode livestockNode = FocusNode();

  // 商业购买日期键盘控制对象
  FocusNode businessPurchaseTimeNode = FocusNode();

  // 住宅购买日期键盘控制对象
  FocusNode housePurchaseTimeNode = FocusNode();

  // 投资凭证有效期键盘控制对象
  FocusNode investmentDateOfDeadlineNode = FocusNode();

  // 机动车键盘控制对象
  FocusNode vehicleNode = FocusNode();

  // 机动车购买日期键盘控制对象
  FocusNode vehiclePurchaseDateNode = FocusNode();

  // 土地地理位置键盘控制对象
  FocusNode landLocationNode = FocusNode();

  // 住宅地理位置键盘控制对象
  FocusNode houseLocationNode = FocusNode();

  // 商业地理位置键盘控制对象
  FocusNode businessLocationNode = FocusNode();

  // 相机列表
  late List<CameraDescription> cameras;

  // 姓名判定
  bool? isNameCorrect;

  // 住宅地址判定
  int? residentialStatus;

  // 公司地址判定
  int? companyAddressStatus;

  // 是否本人判定
  bool? isInPerson;

  // badge 判定
  bool? isBadge;

  // 是否有土地资产
  bool? isHoldLand;

  // 是否有房子
  bool? isHosing;

  // 是否拥有公司
  bool? isBusiness;

  // 是否拒贷
  bool isRefuseLoan = false;

  // 其他身份证明材料照片
  List<String> identityPhotos = [];

  // 薪水证明照片
  List<String> salaryPhotos = [];

  // 流水证明照片
  List<String> moneyFlowPhotos = [];

  // 投资凭证照片
  List<String> investmentPhotos = [];

  // 在职证明照片
  List<String> incumbencyPhotos = [];

  // 土地资产照片
  List<String> landPhotos = [];

  // house资产照片
  List<String> housePhotos = [];

  // business 资产照片
  List<String> businessPhotos = [];

  // 畜牧资产照片
  List<String> livestockPhotos = [];

  // 机动车资产照片
  List<String> vehiclePhotos = [];

  // 其他资产照片
  List<String> otherAssetPhotos = [];

  // 住宅地址
  String residentialAddress = '';

  // 公司地址
  String companyAddress = '';

  // 收款账户列表
  List<InterviewDetailInfoInterviewInfoAccount> accountList = [];

  // 当前选中的收款账户
  InterviewDetailInfoInterviewInfoAccount? selectedWithdrawAccount;

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    cameras = await availableCameras();

    String? clientId = Get.arguments['clientId'];
    String? signRecordId = Get.arguments['signRecordId'];
    pageType = Get.arguments['type'];
    if (MethodUtil.isNullOrEmpty(clientId) || MethodUtil.isNullOrEmpty(signRecordId)) {
      return;
    }

    await _fetchAllAssetOptions();

    _currentSignRecordId = signRecordId!;

    if (pageType == 0) {
      await _fetchInterViewDetail(signRecordId, clientId!);
    }

    if (pageType == 1) {
      await _fetchLastInterviewInfo(signRecordId);
    }

    fetchCache();

    update();
  }

  @override
  void onClose() {
    nameController.dispose();
    correctNameController.dispose();
    residentialAddressController.dispose();
    companyAddressController.dispose();
    salaryController.dispose();
    moneyFlowController.dispose();
    investmentController.dispose();
    investmentDateOfDeadlineController.dispose();
    investmentAmountController.dispose();
    landLocationController.dispose();
    landFullAddressController.dispose();
    landEstimatedController.dispose();
    landMarketValueController.dispose();
    houseLocationController.dispose();
    houseFullAddressController.dispose();
    housePurchaseTimeController.dispose();
    housePriceController.dispose();
    houseMarketValueController.dispose();
    businessLocationController.dispose();
    businessFullAddressController.dispose();
    businessPurchaseTimeController.dispose();
    businessPriceController.dispose();
    businessMarketValueController.dispose();
    livestockController.dispose();
    livestockAmountController.dispose();
    livestockUnitPriceController.dispose();
    livestockTotalValueController.dispose();
    vehicleController.dispose();
    vehiclePurchasePriceController.dispose();
    vehiclePurchaseDateController.dispose();
    vehicleMarketValueController.dispose();
    otherSupportingController.dispose();
    refuseLoanReasonController.dispose();
    salaryNode.dispose();
    moneyFlowNode.dispose();
    investmentNode.dispose();
    livestockNode.dispose();
    investmentDateOfDeadlineNode.dispose();
    vehicleNode.dispose();
    vehiclePurchaseDateNode.dispose();
    businessPurchaseTimeNode.dispose();
    housePurchaseTimeNode.dispose();
    landLocationNode.dispose();
    houseLocationNode.dispose();
    businessLocationNode.dispose();
    super.onClose();
  }

  /*
  * 获取面签详细信息
  * */
  Future<void> _fetchInterViewDetail(String signRecordId, String clientId) async {
    InterviewDetailInfo? detailInfo = await NetworkService.fetchInterviewDetail(
      clientId: clientId,
      signRecordId: signRecordId,
    );

    if (CommonSnackBar.snackBarStatus == SnackbarStatus.CLOSED && MethodUtil.isNullOrEmpty(detailInfo)) {
      Get.back(result: 'error');
    }

    curDetailInfo = detailInfo!;
    nameController.text = curDetailInfo.interviewInfo.name;
    for (var item in curDetailInfo.interviewInfo.address) {
      if (item.type == '1') {
        residentialAddress = item.fullAddress;
        residentialAddressController.text = residentialAddress;
      }
      if (item.type == '2') {
        companyAddress = item.fullAddress;
        companyAddressController.text = companyAddress;
      }
    }

    accountList = curDetailInfo.interviewInfo.account ?? [];

    InterviewDetailInfoInterviewInfoAsset asset = curDetailInfo.interviewInfo.asset;

    if (asset.monthlyIncome != null) {
      InterviewDetailInfoInterviewInfoAssetMonthlyIncome income = asset.monthlyIncome!;
      salaryPhotos = income.imgs;
    }

    if (asset.lastMonthTransactionFlow != null) {
      InterviewDetailInfoInterviewInfoAssetLastMonthTransactionFlow flow = asset.lastMonthTransactionFlow!;
      moneyFlowPhotos = flow.imgs;
    }

    if (asset.investmentCertificate != null) {
      InterviewDetailInfoInterviewInfoAssetInvestmentCertificate investmentCertificate = asset.investmentCertificate!;
      for (var item in _investmentOptions) {
        if (item.cateId == investmentCertificate.cateId) _curInvestment = item;
      }
      investmentController.text = _curInvestment!.cateName;
      investmentPhotos = investmentCertificate.imgs;
    }

    if (asset.landOwnership != null) {
      InterviewDetailInfoInterviewInfoAssetLandOwnership land = asset.landOwnership!;
      isHoldLand = true;
      landPhotos = land.imgs;
    } else {
      isHoldLand = false;
    }

    if (asset.houseOwnership != null) {
      InterviewDetailInfoInterviewInfoAssetHouseOwnership houseOwnership = asset.houseOwnership!;
      isHosing = true;
      housePhotos = houseOwnership.imgs;
    } else {
      isHosing = false;
    }

    if (asset.shopAssets != null) {
      InterviewDetailInfoInterviewInfoAssetShopAssets shopAssets = asset.shopAssets!;
      isBusiness = true;
      businessPhotos = shopAssets.imgs;
    }

    if (asset.livestockAssets != null) {
      InterviewDetailInfoInterviewInfoAssetLivestockAssets livestockAssets = asset.livestockAssets!;
      for (var item in _livestockOptions) {
        if (item.cateId == livestockAssets.cateId) _curLivestock = item;
      }
      livestockController.text = _curLivestock!.cateName;
      livestockPhotos = livestockAssets.imgs;
    }

    if (asset.motorVehicles != null) {
      InterviewDetailInfoInterviewInfoAssetMotorVehicles vehicles = asset.motorVehicles!;
      for (var item in _vehicleOptions) {
        if (item.cateId == vehicles.cateId) _curVehicle = item;
      }
      vehicleController.text = _curVehicle!.cateName;
      vehiclePhotos = vehicles.imgs;
    }

    if (asset.otherAssets != null) {
      InterviewDetailInfoInterviewInfoAssetOtherAssets otherAssets = asset.otherAssets!;
      otherSupportingController.text = otherAssets.addition;
      otherAssetPhotos = otherAssets.imgs;
    }

    update();
  }

  // 获取最后一次提交的面签信息
  Future<void> _fetchLastInterviewInfo(String signRecordId) async {
    LastInterviewInfo? lastInfo = await NetworkService.fetchLastInterViewInfo(signRecordId);
    if (CommonSnackBar.snackBarStatus == SnackbarStatus.CLOSED && MethodUtil.isNullOrEmpty(lastInfo)) {
      Get.back(result: 'error');
    }

    LastInterviewInfoIdentity identity = lastInfo!.identity;
    LastInterviewInfoAsset asset = lastInfo.asset;
    LastInterviewInfoSalary salary = lastInfo.salary;
    nameController.text = identity.clientName;
    isNameCorrect = identity.nameCorrect == '1' ? true : false;
    residentialAddressController.text = identity.residentAddress;
    residentialStatus = int.parse(identity.residentAddressCorrect);
    companyAddressController.text = identity.companyAddress;
    companyAddressStatus = int.parse(identity.companyAddressCorrect);
    isInPerson = identity.isPersonalCorrect == '0' ? false : true;
    identityPhotos = identity.otherInfo;

    _curSalary = _getCategory(salary.monthlyIncome, SubcategoryType.salary);
    salaryController.text = _curSalary?.cateName ?? '';
    salaryPhotos = salary.monthlyIncomeProof;
    _curMoneyFlow = _getCategory(salary.transactionFlow, SubcategoryType.moneyFlow);
    moneyFlowController.text = _curMoneyFlow?.cateName ?? '';
    moneyFlowPhotos = salary.transactionFlowProof;
    _curInvestment = _getCategory(salary.investmentType, SubcategoryType.investment);
    investmentController.text = _curInvestment?.cateName ?? '';
    investmentDateOfDeadlineController.text = salary.investmentExpired;
    investmentAmountController.text = salary.investmentAmount;
    investmentPhotos = salary.investmentProof;

    isBadge = salary.badgeExist == '1';
    incumbencyPhotos = salary.badgeProof;

    isHoldLand = asset.landOwnership == '1';
    landLocationController.text = asset.landContent.addressText;
    landFullAddressController.text = asset.landContent.detailAddress;
    landEstimatedController.text = asset.landContent.area;
    landMarketValueController.text = asset.landContent.estimatedValue;
    curLandCode = asset.landContent.addressCode;
    landPhotos = asset.landProof;

    isHosing = asset.houseOwnership == '1';
    houseLocationController.text = asset.houseContent.addressText;
    houseFullAddressController.text = asset.houseContent.detailAddress;
    housePurchaseTimeController.text = asset.houseContent.purchaseTime;
    housePriceController.text = asset.houseContent.purchasePrice;
    houseMarketValueController.text = asset.houseContent.estimatedValue;
    curHouseCode = asset.houseContent.addressCode;
    housePhotos = asset.houseProof;

    isBusiness = asset.shopAssets == '1';
    businessLocationController.text = asset.shopContent.addressText;
    businessFullAddressController.text = asset.shopContent.detailAddress;
    businessPurchaseTimeController.text = asset.shopContent.purchaseTime;
    businessPriceController.text = asset.shopContent.purchasePrice;
    businessMarketValueController.text = asset.shopContent.estimatedValue;
    curBusinessCode = asset.shopContent.addressCode;
    businessPhotos = asset.shopProof;

    _curLivestock = _getSubcategoryTypeWith(asset.livestockCate, _livestockOptions);
    livestockAmountController.text = asset.livestockContent.number;
    livestockUnitPriceController.text = asset.livestockContent.estimatedValuePer;
    livestockTotalValueController.text = asset.livestockContent.estimatedValueTotal;
    livestockPhotos = asset.livestockProof;

    _curVehicle = _getSubcategoryTypeWith(asset.vehicleCate, _vehicleOptions);
    vehiclePurchasePriceController.text = asset.vehicleContent.purchasePrice;
    vehiclePurchaseDateController.text = asset.vehicleContent.purchaseTime;
    vehicleMarketValueController.text = asset.vehicleContent.estimatedValue;
    vehiclePhotos = asset.vehicleProof;

    otherSupportingController.text = asset.otherAssetsContent;
    otherAssetPhotos = asset.otherAssetsProof;

    accountList = lastInfo.accountInfo;
    update();
    debugPrint(lastInfo.toString());
  }

  // 获取所有下拉列表项
  Future<void> _fetchAllAssetOptions() async {
    AssetOptions? options = await NetworkService.getAssetSubcategory();
    if (options == null) return;
    _salaryOptions = options.monthlyIncome;
    _moneyFlowOptions = options.lastMonthTransactionFlow;
    _investmentOptions = options.investmentCertificate;
    _livestockOptions = options.livestockAssets;
    _vehicleOptions = options.motorVehicles;
  }

  // 从下拉列表中选取特定 id 的类
  Subcategory? _getCategory(String id, SubcategoryType type) {
    switch (type) {
      case SubcategoryType.salary:
        return _getSubcategoryTypeWith(id, _salaryOptions);
      case SubcategoryType.moneyFlow:
        return _getSubcategoryTypeWith(id, _salaryOptions);
      case SubcategoryType.vehicle:
        return _getSubcategoryTypeWith(id, _vehicleOptions);
      case SubcategoryType.livestock:
        return _getSubcategoryTypeWith(id, _livestockOptions);
      case SubcategoryType.investment:
        return _getSubcategoryTypeWith(id, _investmentOptions);
    }
  }

  Subcategory? _getSubcategoryTypeWith(String id, List<Subcategory> items) {
    for (var item in items) {
      if (item.cateId == id) return item;
    }
    return null;
  }

  // 获取缓存
  void fetchCache() {
    String? allCache = Global.instance.prefs.getString(Global.instance.prefs.getString(Global.CURRENT_PHONE_NUMBER));
    if (allCache == null) return;
    Map<String, dynamic> allCacheObj = jsonDecode(allCache);
    Map<String, dynamic>? json = allCacheObj[_currentSignRecordId];
    if (json == null) return;
    InterviewCacheModel cacheModel = InterviewCacheModel.fromJson(json);
    isNameCorrect = cacheModel.nameStatus;
    residentialStatus = cacheModel.residentialStatus;
    companyAddressStatus = cacheModel.companyStatus;
    isInPerson = cacheModel.isInPerson;
    identityPhotos = cacheModel.otherIdentificationPhotos;
    if (!MethodUtil.isNullOrEmpty(cacheModel.salaryAsset?.salary)) {
      _curSalary = cacheModel.salaryAsset!.salary;
      salaryController.text = cacheModel.salaryAsset!.salary!.cateName;
      salaryPhotos = cacheModel.salaryAsset!.salaryPhotos;
    }

    if (!MethodUtil.isNullOrEmpty(cacheModel.salaryAsset?.monthlyFlow)) {
      _curMoneyFlow = cacheModel.salaryAsset!.monthlyFlow;
      moneyFlowController.text = cacheModel.salaryAsset!.monthlyFlow!.cateName;
      moneyFlowPhotos = cacheModel.salaryAsset!.monthlyFlowPhotos;
    }

    if (!MethodUtil.isNullOrEmpty(cacheModel.investmentInfo)) {
      _curInvestment = cacheModel.investmentInfo?.investmentType;
      investmentController.text = cacheModel.investmentInfo!.investmentType!.cateName;
      investmentPhotos = cacheModel.investmentInfo!.photos;
      investmentDateOfDeadlineController.text = cacheModel.investmentInfo!.voucherValidity;
      investmentAmountController.text = cacheModel.investmentInfo!.voucherAmount;
    }

    if (!MethodUtil.isNullOrEmpty(cacheModel.incumbencyInfo)) {
      isBadge = cacheModel.incumbencyInfo!.badge;
      incumbencyPhotos = cacheModel.incumbencyInfo!.photos;
    }

    if (!MethodUtil.isNullOrEmpty(cacheModel.landAsset)) {
      isHoldLand = cacheModel.landAsset!.holdStatus;
      curLandCode = cacheModel.landAsset?.locationCode;
      landLocationController.text = cacheModel.landAsset!.location;
      landFullAddressController.text = cacheModel.landAsset!.fullAddress;
      landEstimatedController.text = cacheModel.landAsset!.estimatedArea;
      landMarketValueController.text = cacheModel.landAsset!.marketValue;
      landPhotos = cacheModel.landAsset!.photos;
    }

    if (!MethodUtil.isNullOrEmpty(cacheModel.houseAsset)) {
      isHosing = cacheModel.houseAsset?.holdStatus;
      houseLocationController.text = cacheModel.houseAsset!.location;
      curHouseCode = cacheModel.houseAsset?.locationCode;
      houseFullAddressController.text = cacheModel.houseAsset!.fullAddress;
      housePurchaseTimeController.text = cacheModel.houseAsset!.purchaseTime;
      housePriceController.text = cacheModel.houseAsset!.purchasePrice;
      houseMarketValueController.text = cacheModel.houseAsset!.marketValue;
      housePhotos = cacheModel.houseAsset!.photos;
    }

    if (!MethodUtil.isNullOrEmpty(cacheModel.businessAsset)) {
      isBusiness = cacheModel.businessAsset?.holdStatus;
      businessLocationController.text = cacheModel.businessAsset!.location;
      curBusinessCode = cacheModel.businessAsset?.locationCode;
      businessFullAddressController.text = cacheModel.businessAsset!.fullAddress;
      businessPurchaseTimeController.text = cacheModel.businessAsset!.purchaseTime;
      businessPriceController.text = cacheModel.businessAsset!.purchasePrice;
      businessMarketValueController.text = cacheModel.businessAsset!.marketValue;
      businessPhotos = cacheModel.businessAsset!.photos;
    }

    if (!MethodUtil.isNullOrEmpty(cacheModel.livestockAsset)) {
      _curLivestock = cacheModel.livestockAsset!.assetType;
      livestockController.text = cacheModel.livestockAsset!.assetType!.cateName;
      livestockAmountController.text = cacheModel.livestockAsset!.amount;
      livestockUnitPriceController.text = cacheModel.livestockAsset!.estimatedUnitPrice;
      livestockTotalValueController.text = cacheModel.livestockAsset!.totalMarketValue;
      livestockPhotos = cacheModel.livestockAsset!.photos;
    }

    if (!MethodUtil.isNullOrEmpty(cacheModel.vehicle)) {
      _curVehicle = cacheModel.vehicle!.vehicleType;
      vehicleController.text = cacheModel.vehicle!.vehicleType!.cateName;
      vehiclePurchasePriceController.text = cacheModel.vehicle!.purchasePrice;
      vehiclePurchaseDateController.text = cacheModel.vehicle!.purchaseDate;
      vehicleMarketValueController.text = cacheModel.vehicle!.marketValue;
      vehiclePhotos = cacheModel.vehicle!.photos;
    }

    if (!MethodUtil.isNullOrEmpty(cacheModel.otherSupportingMaterials)) {
      otherSupportingController.text = cacheModel.otherSupportingMaterials!.addition;
      otherAssetPhotos = cacheModel.otherSupportingMaterials!.photos;
    }

    if (!MethodUtil.isNullOrEmpty(cacheModel.refuseLoanInfo)) {
      isRefuseLoan = cacheModel.refuseLoanInfo!.status;
      refuseLoanReasonController.text = cacheModel.refuseLoanInfo!.recommend;
    }

    update();
  }

  void nameStatusChanged(bool isCorrect) {
    isNameCorrect = isCorrect;
    update();
  }

  void residentialStatusChanged(int status) {
    residentialStatus = status;
    update();
  }

  void companyStatusChanged(int status) {
    companyAddressStatus = status;
    update();
  }

  void badgeStatusChanged(bool isBadge) {
    this.isBadge = isBadge;
    update();
  }

  void landHoldStatusChanged(bool isHold) {
    isHoldLand = isHold;
    update();
  }

  void hosingStatusChanged(bool isHold) {
    isHosing = isHold;
    update();
  }

  void businessStatusChanged(bool isBusiness) {
    this.isBusiness = isBusiness;
    update();
  }

  void refuseLoanStatusChanged() {
    isRefuseLoan = !isRefuseLoan;
    if (!isRefuseLoan) refuseLoanReasonController.clear();
    update();
  }

  // 是否本人状态变更
  void identityStatusChanged(bool status) {
    isInPerson = status;
    update();
  }

  void addPhotoAction(PhotoUploadType type) async {
    var imgPath = await Get.toNamed(ApplicationRoutes.takePhoto, arguments: cameras.first);
    if (MethodUtil.isNullOrEmpty(imgPath)) {
      return;
    }

    // 上传图片
    String? uploadedImgName = await AliyunOssUtil.instance.uploadImage(filePath: imgPath);
    if (uploadedImgName == null) return;

    switch (type) {
      case PhotoUploadType.identity:
        identityPhotos.add(uploadedImgName);
      case PhotoUploadType.salary:
        salaryPhotos.add(uploadedImgName);
      case PhotoUploadType.moneyFlows:
        moneyFlowPhotos.add(uploadedImgName);
      case PhotoUploadType.invest:
        investmentPhotos.add(uploadedImgName);
      case PhotoUploadType.incumbency:
        incumbencyPhotos.add(uploadedImgName);
      case PhotoUploadType.land:
        landPhotos.add(uploadedImgName);
      case PhotoUploadType.residential:
        housePhotos.add(uploadedImgName);
      case PhotoUploadType.business:
        businessPhotos.add(uploadedImgName);
      case PhotoUploadType.livestock:
        livestockPhotos.add(uploadedImgName);
      case PhotoUploadType.motorVehicles:
        vehiclePhotos.add(uploadedImgName);
      case PhotoUploadType.other:
        otherAssetPhotos.add(uploadedImgName);
    }
    update();
  }

  void go2selectSalary() async {
    int? index = await CommonBottomSheet.showBottomSheet('Monthly Income', options: _salaryOptions);
    if (index == null) {
      salaryNode.unfocus();
      return;
    }

    _curSalary = _salaryOptions[index];
    salaryController.text = _curSalary!.cateName;
    salaryNode.unfocus();
    update();
  }

  void go2selectMoneyFlow() async {
    int? index = await CommonBottomSheet.showBottomSheet('Money Flows', options: _moneyFlowOptions);
    if (index == null) {
      moneyFlowNode.unfocus();
      return;
    }
    _curMoneyFlow = _moneyFlowOptions[index];
    moneyFlowController.text = _curMoneyFlow!.cateName;
    moneyFlowNode.unfocus();
    update();
  }

  void go2investmentCertificate() async {
    int? index = await CommonBottomSheet.showBottomSheet('Investment Certificate', options: _investmentOptions);
    if (index == null) {
      investmentNode.unfocus();
      return;
    }
    _curInvestment = _investmentOptions[index];
    investmentController.text = _curInvestment!.cateName;
    investmentNode.unfocus();
    update();
  }

  void selectAccount(int index) {
    selectedWithdrawAccount = accountList[index];
    update();
  }

  void go2selectDate(SelectionDateType type) async {
    DateTime? selectedDate;
    String? result = await Get.bottomSheet(
        enableDrag: false,
        isDismissible: false,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: const BorderRadius.vertical(top: Radius.circular(12))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: Get.back,
                    child: const Text('Cancel', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  const Text('Date of Birth', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                  GestureDetector(
                    onTap: () => Get.back(result: 'confirm'),
                    child: const Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 294,
              child: ScrollDateTimePicker(
                  itemExtent: 54,
                  visibleItem: 5,
                  style: DateTimePickerStyle(
                    activeStyle: TextStyle(color: HexColor('#FF2F2F2F'), fontSize: 16),
                    inactiveStyle: TextStyle(color: HexColor('#FFCCCCCC'), fontSize: 16),
                    activeDecoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: HexColor('#FFCCCCCC'), width: 0.5))),
                  ),
                  dateOption: DateTimePickerOption(
                      dateFormat: DateFormat('MMMMddyyyy'),
                      minDate: DateTime(DateTime.now().year - 80, 01, 01),
                      maxDate: DateTime(DateTime.now().year + 100, 01, 01),
                      initialDate: DateTime.now()),
                  onChange: (date) {
                    selectedDate = date;
                  }),
            )
          ],
        ));

    if (result == null || selectedDate == null) {
      investmentDateOfDeadlineNode.unfocus();
      vehiclePurchaseDateNode.unfocus();
      housePurchaseTimeNode.unfocus();
      businessPurchaseTimeNode.unfocus();
      return;
    }
    switch (type) {
      case SelectionDateType.voucherValidity:
        investmentDateOfDeadlineController.text = DateFormat('MM/dd/yyyy').format(selectedDate!);
      case SelectionDateType.house:
        housePurchaseTimeController.text = DateFormat('MM/dd/yyyy').format(selectedDate!);
      case SelectionDateType.business:
        businessPurchaseTimeController.text = DateFormat('MM/dd/yyyy').format(selectedDate!);
      case SelectionDateType.vehicle:
        vehiclePurchaseDateController.text = DateFormat('MM/dd/yyyy').format(selectedDate!);
    }

    investmentDateOfDeadlineNode.unfocus();
    vehiclePurchaseDateNode.unfocus();
    housePurchaseTimeNode.unfocus();
    businessPurchaseTimeNode.unfocus();
  }

  void go2selectLivestock() async {
    int? index = await CommonBottomSheet.showBottomSheet('Livestock Assets', options: _livestockOptions);
    if (index == null) {
      livestockNode.unfocus();
      return;
    }
    _curLivestock = _livestockOptions[index];
    livestockController.text = _curLivestock!.cateName;
    livestockNode.unfocus();
    update();
  }

  void go2selectVehicle() async {
    int? index = await CommonBottomSheet.showBottomSheet('Motor Vehicles', options: _vehicleOptions);
    if (index == null) {
      vehicleNode.unfocus();
      return;
    }
    _curVehicle = _vehicleOptions[index];
    vehicleController.text = _curVehicle!.cateName;
    vehicleNode.unfocus();
    update();
  }

  void go2selectLocation(LocationOnTapType type) {
    Get.toNamed(ApplicationRoutes.province, arguments: type)?.then((value) {
      landLocationNode.unfocus();
      houseLocationNode.unfocus();
      businessLocationNode.unfocus();
    });
  }

  void backAction() {
    InterviewCacheModel model = InterviewCacheModel();
    model.nameStatus = isNameCorrect;
    model.residentialStatus = residentialStatus;
    model.companyStatus = companyAddressStatus;
    model.isInPerson = isInPerson;
    model.otherIdentificationPhotos = identityPhotos;

    InterviewCacheModelSalaryAsset salaryAsset = InterviewCacheModelSalaryAsset();
    salaryAsset.salary = _curSalary;
    salaryAsset.salaryPhotos = salaryPhotos;
    salaryAsset.monthlyFlow = _curMoneyFlow;
    salaryAsset.monthlyFlowPhotos = moneyFlowPhotos;
    model.salaryAsset = salaryAsset;

    InterviewCacheModelInvestmentInfo investmentInfo = InterviewCacheModelInvestmentInfo();
    investmentInfo.investmentType = _curInvestment;
    investmentInfo.voucherValidity = investmentDateOfDeadlineController.text;
    investmentInfo.voucherAmount = investmentAmountController.text;
    investmentInfo.photos = investmentPhotos;
    investmentInfo.photos = investmentPhotos;
    model.investmentInfo = investmentInfo;

    InterviewCacheModelIncumbencyInfo incumbencyInfo = InterviewCacheModelIncumbencyInfo();
    incumbencyInfo.badge = isBadge;

    incumbencyInfo.photos = incumbencyPhotos;
    model.incumbencyInfo = incumbencyInfo;

    InterviewCacheModelLandAsset landAsset = InterviewCacheModelLandAsset();
    landAsset.holdStatus = isHoldLand;
    landAsset.location = landLocationController.text;
    landAsset.fullAddress = landFullAddressController.text;
    landAsset.estimatedArea = landEstimatedController.text;
    landAsset.marketValue = landMarketValueController.text;
    landAsset.locationCode = curLandCode;
    landAsset.photos = landPhotos;
    model.landAsset = landAsset;

    InterviewCacheModelHouseAsset houseAsset = InterviewCacheModelHouseAsset();
    houseAsset.location = houseLocationController.text;
    houseAsset.locationCode = curHouseCode;
    houseAsset.holdStatus = isHosing;
    houseAsset.fullAddress = houseFullAddressController.text;
    houseAsset.purchaseTime = housePurchaseTimeController.text;
    houseAsset.purchasePrice = housePriceController.text;
    houseAsset.marketValue = houseMarketValueController.text;
    houseAsset.photos = housePhotos;
    model.houseAsset = houseAsset;

    InterviewCacheModelBusinessAsset businessAsset = InterviewCacheModelBusinessAsset();
    businessAsset.holdStatus = isBusiness;
    businessAsset.location = businessLocationController.text;
    businessAsset.locationCode = curBusinessCode;
    businessAsset.fullAddress = businessFullAddressController.text;
    businessAsset.purchaseTime = businessPurchaseTimeController.text;
    businessAsset.purchasePrice = businessPriceController.text;
    businessAsset.marketValue = businessMarketValueController.text;
    businessAsset.photos = businessPhotos;
    model.businessAsset = businessAsset;

    InterviewCacheModelLivestockAsset livestockAsset = InterviewCacheModelLivestockAsset();
    livestockAsset.assetType = _curLivestock;
    livestockAsset.amount = livestockAmountController.text;
    livestockAsset.estimatedUnitPrice = livestockUnitPriceController.text;
    livestockAsset.totalMarketValue = livestockTotalValueController.text;
    livestockAsset.photos = livestockPhotos;
    model.livestockAsset = livestockAsset;

    InterviewCacheModelVehicle vehicle = InterviewCacheModelVehicle();
    vehicle.vehicleType = _curVehicle;
    vehicle.purchasePrice = vehiclePurchasePriceController.text;
    vehicle.purchaseDate = vehiclePurchaseDateController.text;
    vehicle.marketValue = vehicleMarketValueController.text;
    vehicle.photos = vehiclePhotos;
    model.vehicle = vehicle;

    InterviewCacheModelOtherSupportingMaterials otherSupportingMaterials = InterviewCacheModelOtherSupportingMaterials();
    otherSupportingMaterials.addition = otherSupportingController.text;
    otherSupportingMaterials.photos = otherAssetPhotos;
    model.otherSupportingMaterials = otherSupportingMaterials;

    InterviewCacheModelRefuseLoanInfo refuseLoanInfo = InterviewCacheModelRefuseLoanInfo();
    refuseLoanInfo.status = isRefuseLoan;
    refuseLoanInfo.recommend = refuseLoanReasonController.text;
    model.refuseLoanInfo = refuseLoanInfo;

    Get.back(result: model);
  }

  void generateParams(SubmitType type) {
    if (MethodUtil.isNullOrEmpty(isNameCorrect)) {
      return CommonSnackBar.showSnackBar('Please check name whether correct!');
    }

    if (isNameCorrect == false && nameController.text.trim().isEmpty) {
      return CommonSnackBar.showSnackBar('Please enter correct name!');
    }

    if (MethodUtil.isNullOrEmpty(residentialStatus)) {
      return CommonSnackBar.showSnackBar('Please check residential address whether correct!');
    }

    if (MethodUtil.isNullOrEmpty(companyAddressStatus)) {
      return CommonSnackBar.showSnackBar('Please check company address whether correct!');
    }

    if (MethodUtil.isNullOrEmpty(isInPerson)) {
      return CommonSnackBar.showSnackBar('Whether in person item cannot be empty!');
    }

    if (MethodUtil.isNullOrEmpty(selectedWithdrawAccount)) {
      return CommonSnackBar.showSnackBar('Please select withdraw account!');
    }

    Map<String, dynamic> params = {};
    params['sign_record_id'] = _currentSignRecordId;
    params['withdraw_type'] = selectedWithdrawAccount!.withdrawType;
    params['withdraw_relation'] = selectedWithdrawAccount!.withdrawRelation;

    Map<String, dynamic> identity = {};
    identity['name_correct'] = isNameCorrect == true ? '1' : '0';
    identity['client_name'] = nameController.text;
    identity['resident_address_correct'] = residentialStatus == 0 ? '0' : (residentialStatus == 1 ? '1' : '2');
    identity['resident_address'] = residentialAddressController.text;
    identity['company_address_correct'] = companyAddressStatus == 0 ? '0' : (companyAddressStatus == 1 ? '1' : '2');
    identity['company_address'] = companyAddressController.text;
    identity['is_personal_correct'] = isInPerson == true ? '1' : '0';
    identity['other_info'] = MethodUtil.configImageNames(identityPhotos);
    params['identity'] = jsonEncode(identity);

    Map<String, dynamic> salary = {};
    salary['monthly_income'] = _curSalary?.cateId ?? '';
    salary['monthly_income_proof'] = MethodUtil.configImageNames(salaryPhotos);

    salary['transaction_flow'] = _curMoneyFlow?.cateId ?? '';
    salary['transaction_flow_proof'] = MethodUtil.configImageNames(moneyFlowPhotos);

    salary['investment_type'] = _curInvestment?.cateId ?? '';
    salary['investment_expired'] = investmentDateOfDeadlineController.text;
    salary['investment_amount'] = investmentAmountController.text;
    salary['investment_proof'] = MethodUtil.configImageNames(investmentPhotos);

    salary['badge_exist'] = isBadge == true ? '1' : '0';
    salary['badge_proof'] = MethodUtil.configImageNames(incumbencyPhotos);

    params['salary'] = jsonEncode(salary);

    Map<String, dynamic> asset = {};
    asset['land_ownership'] = isHoldLand == true ? '1' : '0';
    asset['land_proof'] = MethodUtil.configImageNames(landPhotos);

    if (isHosing == true) {
      asset['house_ownership'] = '1';
      Map<String, dynamic> landContent = {};
      landContent['address_code'] = curLandCode ?? '';
      landContent['detail_address'] = landFullAddressController.text;
      landContent['area'] = landEstimatedController.text;
      landContent['estimated_value'] = landMarketValueController.text;
      asset['land_content'] = jsonEncode(landContent);
      asset['house_proof'] = MethodUtil.configImageNames(housePhotos);
    }

    Map<String, dynamic> houseContent = {};
    houseContent['address_code'] = curHouseCode ?? '';
    houseContent['detail_address'] = houseFullAddressController.text;
    houseContent['purchase_time'] = housePurchaseTimeController.text;
    houseContent['purchase_price'] = housePriceController.text;
    houseContent['estimated_value'] = houseMarketValueController.text;
    asset['house_content'] = jsonEncode(houseContent);
    asset['shop_assets'] = isBusiness == true ? '1' : '0';
    asset['shop_proof'] = MethodUtil.configImageNames(businessPhotos);

    Map<String, dynamic> shopContent = {};
    shopContent['address_code'] = curBusinessCode ?? '';
    shopContent['detail_address'] = businessFullAddressController.text;
    shopContent['purchase_time'] = businessPurchaseTimeController.text;
    shopContent['purchase_price'] = businessPriceController.text;
    shopContent['estimated_value'] = businessMarketValueController.text;
    asset['shop_content'] = jsonEncode(shopContent);
    asset['livestock_assets'] = _curLivestock == null ? '0' : '1';
    asset['livestock_cate'] = _curLivestock?.cateId ?? '';
    asset['livestock_proof'] = MethodUtil.configImageNames(livestockPhotos);

    Map<String, dynamic> livestockContent = {};
    livestockContent['number'] = livestockAmountController.text;
    livestockContent['estimated_value_total'] = livestockTotalValueController.text;
    livestockContent['estimated_value_per'] = livestockUnitPriceController.text;
    asset['livestock_content'] = jsonEncode(livestockContent);
    asset['vehicle'] = _curVehicle == null ? '0' : '1';
    asset['vehicle_cate'] = _curVehicle?.cateId ?? '';
    asset['vehicle_proof'] = MethodUtil.configImageNames(vehiclePhotos);
    Map<String, dynamic> vehicleContent = {};
    vehicleContent['purchase_price'] = vehiclePurchasePriceController.text;
    vehicleContent['purchase_time'] = vehiclePurchaseDateController.text;
    vehicleContent['estimated_value'] = vehicleMarketValueController.text;
    asset['vehicle_content'] = jsonEncode(vehicleContent);
    asset['other_assets'] = otherSupportingController.text.trim().isEmpty ? '0' : '1';
    asset['other_assets_content'] = otherSupportingController.text;
    asset['other_assets_proof'] = MethodUtil.configImageNames(otherAssetPhotos);
    params['asset'] = jsonEncode(asset);
    switch (type) {
      case SubmitType.interview:
        if (isRefuseLoan) {
          Map<String, dynamic> addition = {};
          addition['addition_status'] = isRefuseLoan ? '1' : '';
          addition['content'] = refuseLoanReasonController.text;
          params['addition'] = jsonEncode(addition);
        }
        _interviewAction(params);
      case SubmitType.reconsideration:
        _reconsiderationAction(params);
    }
  }

  void _interviewAction(Map<String, dynamic> params) async {
    if (pageType == 0) {
      Get.toNamed(ApplicationRoutes.contract, arguments: {
        'detail_params': params,
        'pid': curDetailInfo.clientInfo.credit.pid,
        'rid': curDetailInfo.clientInfo.credit.rid,
        'money': curDetailInfo.clientInfo.credit.amount,
        'token': curDetailInfo.clientInfo.credit.token,
      });
    } else {
      bool isSuccess = await NetworkService.resaveInterviewContent(params);
      if(isSuccess) {
        Get.back(result: 'success');
      }
    }
  }

  void _reconsiderationAction(Map<String, dynamic> params) {
    Get.toNamed(
      ApplicationRoutes.reconsideration,
      arguments: {'params': params, 'camera': cameras.first},
    );
  }

  void photoItemOnTap(int index, {required PhotoUploadType type}) {
    debugPrint('DEBUG: 点击的图片索引是 $index, type 是 $type');
  }

  late List<Subcategory> _salaryOptions;
  late List<Subcategory> _moneyFlowOptions;
  late List<Subcategory> _investmentOptions;
  late List<Subcategory> _livestockOptions;
  late List<Subcategory> _vehicleOptions;

  // 当前选中的月薪
  Subcategory? _curSalary;

  // 当前选中的月流水
  Subcategory? _curMoneyFlow;

  // 当前选中的投资凭证
  Subcategory? _curInvestment;

  // 当前选中的畜牧资产
  Subcategory? _curLivestock;

  // 当前选中的机动车资产
  Subcategory? _curVehicle;

  // 当前选中的土地地理编码
  String? curLandCode;

  // 当前选中的住宅地理编码
  String? curHouseCode;

  // 当前选中的商户地理编码
  String? curBusinessCode;

  // 当前的item Id
  late String _currentSignRecordId;
}
