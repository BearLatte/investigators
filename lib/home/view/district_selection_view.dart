import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/common/base_title_view.dart';
import 'package:investigators/home/controller/district_controller.dart';

import '../../models/address_list_item.dart';
import '../../utils/global.dart';
import '../../utils/hex_color.dart';
import 'city_selection_item.dart';

class DistrictSelectionView extends StatelessWidget {
  const DistrictSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressListItem? lastItem;
    return BaseTitleView(
      title: 'Select Address',
      body: GetBuilder<DistrictController>(
        init: Get.put(DistrictController()),
        builder: (DistrictController controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: HexColor('#ececec'),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(controller.selectedProvince.name, style: TextStyle(color: Global.instance.themeColor, fontSize: 13)),
            ),
            Container(
              color: HexColor('#ececec'),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(controller.selectedCity.name, style: TextStyle(color: Global.instance.themeColor, fontSize: 13)),
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(children: [
              ...List.generate(controller.districtList.length, (index) {
                AddressListItem item = controller.districtList[index];
                if (item.prefix == lastItem?.prefix) {
                  return CitySelectionItem.generateItem(item.name, onPressed: () => controller.selectedItem(item));
                } else {
                  lastItem = item;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [CitySelectionItem.generateSectionBar(item.prefix), CitySelectionItem.generateItem(item.name, onPressed: () => controller.selectedItem(item))],
                  );
                }
              })
            ])))
          ],
        ),
      ),
    );
  }
}
