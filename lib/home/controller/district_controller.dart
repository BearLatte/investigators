import 'package:get/get.dart';
import 'package:investigators/home/controller/interview_detail_controller.dart';
import 'package:investigators/models/address_list_item.dart';
import 'package:investigators/router/index.dart';

import '../../common/common_snack_bar.dart';
import '../../network_service/index.dart';

class DistrictController extends GetxController {
  late AddressListItem selectedProvince;
  late AddressListItem selectedCity;
  List<AddressListItem> districtList = [];
  late LocationOnTapType currentType;

  @override
  void onInit() {
    super.onInit();
    selectedProvince = Get.arguments['province'];
    selectedCity = Get.arguments['city'];
    currentType = Get.arguments['type'];
    _fetchDistrictList();
  }

  Future<void> _fetchDistrictList() async {
    List<AddressListItem>? itemList = await NetworkService.fetchAddress('barangay', parentCode: selectedCity.code);

    if (itemList == null) {
      CommonSnackBar.showSnackBar('Unknown Error!');
      return Get.back();
    }
    itemList.sort((a, b) => a.prefix.compareTo(b.prefix));
    districtList = itemList;
    update();
  }

  void selectedItem(AddressListItem item) {
    InterviewDetailController detailController = Get.find<InterviewDetailController>();
    switch (currentType) {
      case LocationOnTapType.land:
        detailController.landLocationController.text = '${selectedProvince.name} ${selectedCity.name} ${item.name}';
        detailController.curLandCode = item.code;
      case LocationOnTapType.house:
        detailController.houseLocationController.text = '${selectedProvince.name} ${selectedCity.name} ${item.name}';
        detailController.curHouseCode = item.code;
      case LocationOnTapType.business:
        detailController.businessLocationController.text = '${selectedProvince.name} ${selectedCity.name} ${item.name}';
        detailController.curBusinessCode = item.code;
    }

    Get.until((route) => route.settings.name == ApplicationRoutes.interviewDetail);
  }
}
