import 'package:get/get.dart';
import 'package:investigators/common/common_snack_bar.dart';
import 'package:investigators/network_service/index.dart';
import 'package:investigators/router/index.dart';

import '../../models/address_list_item.dart';
import 'interview_detail_controller.dart';

class ProvinceController extends GetxController {
  List<AddressListItem> provinces = [];
  late LocationOnTapType currentType;

  @override
  void onInit() {
    super.onInit();
    currentType = Get.arguments;
    _loadProvince();
  }

  void _loadProvince() async {
    List<AddressListItem>? provinceList = await NetworkService.fetchAddress('province');
    if (provinceList == null) {
      CommonSnackBar.showSnackBar('Unknown Error!');
      return Get.back();
    }
    provinceList.sort((a, b) => a.prefix.compareTo(b.prefix));
    provinces = provinceList;
    update();
  }

  void selectedItem(AddressListItem item) {
    Get.toNamed(ApplicationRoutes.city, arguments: {'province': item, 'type': currentType});
  }
}
