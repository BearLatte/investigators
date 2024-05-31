import 'package:get/get.dart';
import 'package:investigators/models/address_list_item.dart';
import 'package:investigators/network_service/index.dart';
import 'package:investigators/router/index.dart';

import '../../common/common_snack_bar.dart';
import 'interview_detail_controller.dart';

class CityController extends GetxController {
  late AddressListItem selectedProvince;
  List<AddressListItem> cities = [];
  late LocationOnTapType currentType;

  @override
  void onInit() {
    super.onInit();
    selectedProvince = Get.arguments['province'];
    currentType = Get.arguments['type'];
    _fetchCityList();
  }

  void _fetchCityList() async {
    List<AddressListItem>? itemList = await NetworkService.fetchAddress('city', parentCode: selectedProvince.code);

    if (itemList == null) {
      CommonSnackBar.showSnackBar('Unknown Error!');
      return Get.back();
    }
    itemList.sort((a, b) => a.prefix.compareTo(b.prefix));
    cities = itemList;
    update();
  }

  void selectedItem(AddressListItem item) {
    Get.toNamed(ApplicationRoutes.district, arguments: {'province': selectedProvince, 'city': item, 'type': currentType});
  }
}
