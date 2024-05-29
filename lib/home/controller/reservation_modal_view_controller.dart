import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:investigators/common/common_snack_bar.dart';
import 'package:investigators/models/address_model.dart';
import 'package:investigators/utils/method_util.dart';

class ReservationModalViewController extends GetxController {
  String? selectedAddId;

  // 必传参数，所有地址
  late List<AddressModel> addressList;

  // 日期输入控制器
  TextEditingController dateEditingController = TextEditingController();

  // 时间输入控制器
  TextEditingController timeController = TextEditingController();

  // 当前选中的地址对象
  AddressModel? selectedAddress;

  // 当前选中的日期
  DateTime? selectedDate;

  // 当前选中的时间
  DateTime? selectedTime;

  @override
  void onInit() {
    super.onInit();
    addressList = Get.arguments['addressList'];
    String? dateTime = Get.arguments['selectedTime'];
    if (!MethodUtil.isNullOrEmpty(dateTime)) {
      DateFormat format = DateFormat('MM/dd/yyyy hh:mm');
      DateTime selectedDateTime = format.parse(dateTime!);
      selectedDate = selectedDateTime;
      selectedTime = selectedDateTime;
      dateEditingController.text = DateFormat.yMMMMd().format(selectedDateTime);
      timeController.text = DateFormat.Hm().format(selectedDateTime);
    }

    selectedAddId = Get.arguments['selectedAddId'];
    if (selectedAddId != null) {
      for (var item in addressList) {
        if(item.addressId == selectedAddId) {
          selectedAddress = item;
        }
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    dateEditingController.dispose();
    timeController.dispose();
  }

  void selectedAddressAction(AddressModel address) {
    selectedAddress = address;
    selectedAddId = address.addressId;
    update();
  }

  void dateChanged(DateTime date) {
    selectedDate = date;
    update();
  }

  void confirmSelectDate() {
    selectedDate ??= DateTime.now();
    dateEditingController.text = DateFormat.yMMMMd().format(selectedDate!);
    Get.back();
  }

  void confirmAction() {
    if (selectedDate == null) {
      return CommonSnackBar.showSnackBar('Please select reservation date!');
    }

    if (selectedTime == null) {
      return CommonSnackBar.showSnackBar('Please select reservation time!');
    }

    if (selectedAddress == null) {
      return CommonSnackBar.showSnackBar('Please select reservation address!');
    }

    String date = DateFormat.yMd().format(selectedDate!);
    String time = DateFormat.Hm().format(selectedTime!);
    Get.back(result: {'time': '$date $time', 'address': selectedAddress!.addressId});
  }

  void showTimeSelector() async {
    DateTime? time = await DatePicker.showTimePicker(Get.context!);
    if (time == null) return;
    selectedTime = time;
    timeController.text = DateFormat.Hm().format(time);
  }
}
