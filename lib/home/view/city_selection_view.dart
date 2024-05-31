import 'package:flutter/material.dart';
import 'package:investigators/common/base_title_view.dart';
import 'package:investigators/home/controller/city_controller.dart';
import 'package:get/get.dart';
import 'package:investigators/utils/hex_color.dart';

import '../../models/address_list_item.dart';
import '../../utils/global.dart';
import 'city_selection_item.dart';

class CitySelectionView extends StatelessWidget {
  const CitySelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressListItem? lastItem;
    return BaseTitleView(
      title: 'Select Address',
      body: GetBuilder<CityController>(
        init: Get.put(CityController()),
        builder: (CityController controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: HexColor('#EFEFEF'),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(controller.selectedProvince.name, style: TextStyle(color: Global.instance.themeColor, fontSize: 13)),
            ),
            Expanded(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(children: [
                    ...List.generate(controller.cities.length, (index) {
                      AddressListItem item = controller.cities[index];
                      if (item.prefix == lastItem?.prefix) {
                        return CitySelectionItem.generateItem(item.name, onPressed: () => controller.selectedItem(item));
                      } else {
                        lastItem = item;
                        return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                          CitySelectionItem.generateSectionBar(item.prefix),
                          CitySelectionItem.generateItem(item.name, onPressed: () => controller.selectedItem(item))
                        ]);
                      }
                    })
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
