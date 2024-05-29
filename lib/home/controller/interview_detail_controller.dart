import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:investigators/common/common_bottom_sheet.dart';
import 'package:investigators/common/common_snack_bar.dart';
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

  // 薪水键盘控制对象
  FocusNode salaryNode = FocusNode();

  // 流水键盘控制对象
  FocusNode moneyFlowNode = FocusNode();

  // 投资键盘控制对象
  FocusNode investmentNode = FocusNode();

  // 投资凭证有效期键盘控制对象
  FocusNode investmentDateOfDeadlineNode = FocusNode();

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

  // 住宅地址
  String residentialAddress = '';

  // 公司地址
  String companyAddress = '';

  @override
  void onInit() async {
    super.onInit();

    tabController = TabController(length: tabs.length, vsync: this);

    String? clientId = Get.arguments['clientId'];
    String? signRecordId = Get.arguments['signRecordId'];
    if (MethodUtil.isNullOrEmpty(clientId) || MethodUtil.isNullOrEmpty(signRecordId)) {
      return;
    }
    fetchInterViewDetail(signRecordId!, clientId!);

    cameras = await availableCameras();
  }

  @override
  void onClose() {
    tabController.dispose();
    nameController.dispose();
    residentialAddressController.dispose();
    companyAddressController.dispose();
    salaryController.dispose();
    salaryNode.dispose();
    moneyFlowController.dispose();
    moneyFlowNode.dispose();
    investmentController.dispose();
    investmentNode.dispose();
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
      default:
        break;
    }

    update();
  }

  void go2selectSalary() async {
    if (_salaryOptions.isEmpty) {
      List<Subcategory>? salaryOptions = await NetworkService.getAssetSubcategory('monthly_income');
      if (salaryOptions == null) return;
      for (var item in salaryOptions) {
        _salaryOptions.add(item.cateName);
      }
    }
    int? index = await CommonBottomSheet.showBottomSheet('Monthly Income', options: _salaryOptions);
    if (index == null) {
      salaryNode.unfocus();
      return;
    }
    salaryController.text = _salaryOptions[index];
    salaryNode.unfocus();
    update();
  }

  void go2selectMoneyFlow() async {
    if (_moneyFlowOptions.isEmpty) {
      List<Subcategory>? options = await NetworkService.getAssetSubcategory('last_month_transaction_flow');
      if (options == null) return;
      for (var item in options) {
        _moneyFlowOptions.add(item.cateName);
      }
    }

    int? index = await CommonBottomSheet.showBottomSheet('Money Flows', options: _moneyFlowOptions);
    if (index == null) {
      moneyFlowNode.unfocus();
      return;
    }
    moneyFlowController.text = _moneyFlowOptions[index];
    moneyFlowNode.unfocus();
    update();
  }

  void go2investmentCertificate() async {
    if (_investmentOptions.isEmpty) {
      List<Subcategory>? options = await NetworkService.getAssetSubcategory('investment_certificate');
      if (options == null) return;
      for (var item in options) {
        _investmentOptions.add(item.cateName);
      }
    }

    int? index = await CommonBottomSheet.showBottomSheet('Investment Certificate', options: _investmentOptions);
    if (index == null) {
      investmentNode.unfocus();
      return;
    }
    investmentController.text = _investmentOptions[index];
    investmentNode.unfocus();
    update();
  }

  void go2selectInvestmentDateOfDeadline() async {
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
      return;
    }
    investmentDateOfDeadlineController.text = DateFormat('MM/dd/yyyy').format(selectedDate!);
    investmentDateOfDeadlineNode.unfocus();
  }

  void photoItemOnTap(int index, {required PhotoUploadType type}) {
    debugPrint('DEBUG: 点击的图片索引是 $index, type 是 $type');
  }

  final List<String> _salaryOptions = [];
  final List<String> _moneyFlowOptions = [];
  final List<String> _investmentOptions = [];
}
