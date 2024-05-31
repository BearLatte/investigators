import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:investigators/common/common_bottom_sheet.dart';
import 'package:investigators/common/common_snack_bar.dart';
import 'package:investigators/models/asset_options.dart';
import 'package:investigators/models/interview_cache_model.dart';
import 'package:investigators/models/interview_detail_info.dart';
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

class InterviewDetailController extends GetxController with GetTickerProviderStateMixin {
  late InterviewDetailInfo curDetailInfo;
  late TabController tabController;
  List<Tab> tabs = const [Tab(text: 'Interview Information'), Tab(text: 'User Information')];

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

  @override
  void onInit() async {
    super.onInit();

    tabController = TabController(length: tabs.length, vsync: this);

    String? clientId = Get.arguments['clientId'];
    String? signRecordId = Get.arguments['signRecordId'];
    if (MethodUtil.isNullOrEmpty(clientId) || MethodUtil.isNullOrEmpty(signRecordId)) {
      return;
    }
    await fetchAllAssetOptions();
    fetchInterViewDetail(signRecordId!, clientId!);
    cameras = await availableCameras();
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
  void fetchInterViewDetail(String signRecordId, String clientId) async {
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

  // 获取所有下拉列表项
  Future<void> fetchAllAssetOptions() async {
    AssetOptions? options = await NetworkService.getAssetSubcategory();
    if (options == null) return;
    _salaryOptions = options.monthlyIncome;
    _moneyFlowOptions = options.lastMonthTransactionFlow;
    _investmentOptions = options.investmentCertificate;
    _livestockOptions = options.livestockAssets;
    _vehicleOptions = options.motorVehicles;
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
    String? uploadedImgName = await AliyunOssUtil.instance.uploadImage(imgPath);
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
    model.otherSupportingMaterials = otherSupportingMaterials;

    var jsonString =  model.toString();
    debugPrint(jsonString);
  }

  void interviewAction() {
    debugPrint('DEBUG: 保存面签内容');
  }

  void reconsiderationAction() {
    debugPrint('DEBUG: 提交复议');
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
}
