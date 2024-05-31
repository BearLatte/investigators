import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/common/base_title_view.dart';
import 'package:investigators/home/controller/province_controller.dart';
import 'package:investigators/models/address_list_item.dart';
import 'package:investigators/utils/global.dart';
import 'package:investigators/utils/hex_color.dart';

import 'city_selection_item.dart';

class ProvinceSelectionView extends StatelessWidget {
  const ProvinceSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressListItem? lastProvince;
    return BaseTitleView(
      title: 'Select Address',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: HexColor('#ececec'),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text('Province', style: TextStyle(color: Global.instance.themeColor, fontSize: 13)),
          ),
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                child: GetBuilder<ProvinceController>(
                  init: Get.put(ProvinceController()),
                  builder: (ProvinceController controller) => Column(children: [
                    ...List.generate(controller.provinces.length, (index) {
                      AddressListItem item = controller.provinces[index];
                      if (item.prefix == lastProvince?.prefix) {
                        return CitySelectionItem.generateItem(item.name, onPressed: () => controller.selectedItem(item));
                      } else {
                        lastProvince = item;
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
          )
        ],
      ),
    );
  }
}
