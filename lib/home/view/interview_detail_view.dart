import 'dart:collection';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/common/base_title_view.dart';
import 'package:investigators/home/controller/interview_detail_controller.dart';
import 'package:investigators/utils/global.dart';
import 'package:investigators/utils/hex_color.dart';

import '../../models/interview_detail_info.dart';

class InterviewDetailView extends StatelessWidget {
  const InterviewDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InterviewDetailController>(
        init: Get.put(InterviewDetailController()),
        builder: (controller) => BaseTitleView(
              title: 'Interview Details',
              backAction: controller.backAction,
              body: Column(children: [
                Container(
                  color: Global.instance.themeColor,
                  child: TabBar(
                    tabs: controller.tabs,
                    controller: controller.tabController,
                    dividerHeight: 0,
                    indicatorColor: Colors.white,
                    labelStyle: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(color: HexColor('#9FB6C6'), fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [_interviewInformationView(), _userInformationView()],
                  ),
                )
              ]),
            ));
  }

  Widget _interviewInformationView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: GetBuilder<InterviewDetailController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _sectionHeader('Identification Information'),
            _subSection('Name'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(children: [
                    const SizedBox(height: 8),
                    _itemTextField(controller.nameController),
                    if (controller.isNameCorrect == false) const SizedBox(height: 10),
                    if (controller.isNameCorrect == false) _itemTextField(controller.correctNameController, isEnable: true),
                  ]),
                ),
                _radioItem('Correct', onTap: () => controller.nameStatusChanged(true), width: 65, height: 50, isChecked: controller.isNameCorrect == true),
                _radioItem('Incorrect', onTap: () => controller.nameStatusChanged(false), width: 75, height: 50, isChecked: controller.isNameCorrect == false)
              ],
            ),
            _subSection('Residential Address'),
            Row(children: [
              Expanded(child: _itemTextField(controller.residentialAddressController, isEnable: false, isMultiLine: true)),
              SizedBox(
                  width: 100,
                  child: Column(children: [
                    _radioItem('Correct', onTap: () => controller.residentialStatusChanged(1), height: 25, isChecked: controller.residentialStatus == 1),
                    _radioItem('Incorrect', onTap: () => controller.residentialStatusChanged(2), height: 25, isChecked: controller.residentialStatus == 2),
                    _radioItem('Unverifiable', onTap: () => controller.residentialStatusChanged(3), height: 25, isChecked: controller.residentialStatus == 3)
                  ]))
            ]),
            _subSection('Company Address'),
            Row(children: [
              Expanded(child: _itemTextField(controller.companyAddressController, isEnable: false, isMultiLine: true)),
              SizedBox(
                  width: 100,
                  child: Column(children: [
                    _radioItem('Correct', onTap: () => controller.companyStatusChanged(1), height: 25, isChecked: controller.companyAddressStatus == 1),
                    _radioItem('Incorrect', onTap: () => controller.companyStatusChanged(2), height: 25, isChecked: controller.companyAddressStatus == 2),
                    _radioItem('Unverifiable', onTap: () => controller.companyStatusChanged(3), height: 25, isChecked: controller.companyAddressStatus == 3)
                  ]))
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Whether in person', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _radioItem('Yes', onTap: () => controller.identityStatusChanged(true), height: 50, isChecked: controller.isInPerson == true),
                    _radioItem('No', onTap: () => controller.identityStatusChanged(false), height: 50, isChecked: controller.isInPerson == false),
                  ],
                ),
              )
            ]),
            _sectionHeader('Other Identification'),
            _photoUploadItem(
              controller.identityPhotos,
              itemOnTap: (index) => controller.photoItemOnTap(index, type: PhotoUploadType.identity),
              addAction: () => controller.addPhotoAction(PhotoUploadType.identity),
            ),
            const SizedBox(height: 20),
            _sectionHeader('Salary category'),
            _subSection('Monthly Income'),
            _dropdownField(controller.salaryController, hintText: 'Please select your salary!', node: controller.salaryNode, onTap: controller.go2selectSalary),
            if (controller.salaryController.text.trim().isNotEmpty && controller.salaryController.text != 'None' && controller.salaryController.text != 'Nothing')
              _photoUploadItem(
                controller.salaryPhotos,
                addAction: () => controller.addPhotoAction(PhotoUploadType.salary),
                itemOnTap: (index) => controller.photoItemOnTap(index, type: PhotoUploadType.salary),
              ),
            _subSection('Money Flows(nearly 1 month)'),
            _dropdownField(controller.moneyFlowController, hintText: 'Please select your money flow!', node: controller.moneyFlowNode, onTap: controller.go2selectMoneyFlow),
            if (controller.moneyFlowController.text.trim().isNotEmpty && controller.moneyFlowController.text != 'None' && controller.moneyFlowController.text != 'Nothing')
              _photoUploadItem(
                controller.moneyFlowPhotos,
                addAction: () => controller.addPhotoAction(PhotoUploadType.moneyFlows),
                itemOnTap: (index) => controller.photoItemOnTap(index, type: PhotoUploadType.moneyFlows),
              ),
            _subSection('Investment Certificate'),
            _dropdownField(
              controller.investmentController,
              hintText: 'Please select your investment certificate!',
              node: controller.investmentNode,
              onTap: controller.go2investmentCertificate,
            ),
            if (controller.investmentController.text.trim().isNotEmpty && controller.investmentController.text != 'None' && controller.investmentController.text != 'Nothing')
              _subSection('Voucher Validity'),
            if (controller.investmentController.text.trim().isNotEmpty && controller.investmentController.text != 'None' && controller.investmentController.text != 'Noting')
              _dropdownField(
                hintText: 'Please select Voucher Validity!',
                controller.investmentDateOfDeadlineController,
                onTap: () => controller.go2selectDate(SelectionDateType.voucherValidity),
                node: controller.investmentDateOfDeadlineNode,
              ),
            if (controller.investmentController.text.trim().isNotEmpty && controller.investmentController.text != 'None' && controller.investmentController.text != 'Nothing')
              _subSection('Voucher Amount'),
            if (controller.investmentController.text.trim().isNotEmpty && controller.investmentController.text != 'None' && controller.investmentController.text != 'Nothing')
              _itemTextField(controller.investmentAmountController, isEnable: true),
            if (controller.investmentController.text.trim().isNotEmpty && controller.investmentController.text != 'None' && controller.investmentController.text != 'Nothing')
              _photoUploadItem(
                controller.investmentPhotos,
                addAction: () => controller.addPhotoAction(PhotoUploadType.invest),
                itemOnTap: (index) => controller.photoItemOnTap(index, type: PhotoUploadType.invest),
              ),
            _subSection('Incumbency Certification'),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Badge', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 15, fontWeight: FontWeight.bold)),
              Row(children: [
                _radioItem('Yes', onTap: () => controller.badgeStatusChanged(true), isChecked: controller.isBadge == true),
                _radioItem('No', onTap: () => controller.badgeStatusChanged(false), isChecked: controller.isBadge == false),
              ])
            ]),
            if (controller.isBadge == true)
              _photoUploadItem(
                controller.incumbencyPhotos,
                itemOnTap: (index) => controller.photoItemOnTap(index, type: PhotoUploadType.incumbency),
                addAction: () => controller.addPhotoAction(PhotoUploadType.incumbency),
              ),
            const SizedBox(height: 20),
            _sectionHeader('Asset Class'),
            _subSection('Land'),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Fertile farmland / Wooded area', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 15, fontWeight: FontWeight.bold)),
              Row(children: [
                _radioItem('Hold', onTap: () => controller.landHoldStatusChanged(true), isChecked: controller.isHoldLand == true),
                _radioItem('Nothold', onTap: () => controller.landHoldStatusChanged(false), isChecked: controller.isHoldLand == false),
              ])
            ]),
            if (controller.isHoldLand == true)
              _assetItem(
                locationOnTap: () => controller.go2selectLocation(LocationOnTapType.land),
                locationNode: controller.landLocationNode,
                locationController: controller.landLocationController,
                fullAddressController: controller.landFullAddressController,
                estimatedAreaController: controller.landEstimatedController,
                marketValueController: controller.landMarketValueController,
                photos: controller.landPhotos,
                photoAddAction: () => controller.addPhotoAction(PhotoUploadType.land),
                photoItemOnTap: (index) => controller.photoItemOnTap(index, type: PhotoUploadType.land),
              ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Housing', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 15, fontWeight: FontWeight.bold)),
              Row(children: [
                _radioItem('Hold', onTap: () => controller.hosingStatusChanged(true), isChecked: controller.isHosing == true),
                _radioItem('Nothold', onTap: () => controller.hosingStatusChanged(false), isChecked: controller.isHosing == false),
              ])
            ]),
            if (controller.isHosing == true)
              _assetItem(
                locationOnTap: () => controller.go2selectLocation(LocationOnTapType.house),
                locationNode: controller.houseLocationNode,
                locationController: controller.houseLocationController,
                fullAddressController: controller.houseFullAddressController,
                timeOfPurchaseController: controller.housePurchaseTimeController,
                priceController: controller.housePriceController,
                marketValueController: controller.houseMarketValueController,
                photos: controller.housePhotos,
                photoAddAction: () => controller.addPhotoAction(PhotoUploadType.residential),
                photoItemOnTap: (index) => controller.photoItemOnTap(index, type: PhotoUploadType.residential),
                purchaseTimeOnTap: () => controller.go2selectDate(SelectionDateType.house),
                purchaseTimeNode: controller.housePurchaseTimeNode,
              ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Business', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 15, fontWeight: FontWeight.bold)),
              Row(children: [
                _radioItem('Hold', onTap: () => controller.businessStatusChanged(true), isChecked: controller.isBusiness == true),
                _radioItem('Nothold', onTap: () => controller.businessStatusChanged(false), isChecked: controller.isBusiness == false),
              ])
            ]),
            if (controller.isBusiness == true)
              _assetItem(
                locationOnTap: () => controller.go2selectLocation(LocationOnTapType.business),
                locationNode: controller.businessLocationNode,
                locationController: controller.businessLocationController,
                fullAddressController: controller.businessFullAddressController,
                timeOfPurchaseController: controller.businessPurchaseTimeController,
                priceController: controller.businessPriceController,
                marketValueController: controller.businessMarketValueController,
                photos: controller.businessPhotos,
                photoAddAction: () => controller.addPhotoAction(PhotoUploadType.business),
                photoItemOnTap: (index) => controller.photoItemOnTap(index, type: PhotoUploadType.business),
                purchaseTimeOnTap: () => controller.go2selectDate(SelectionDateType.business),
                purchaseTimeNode: controller.businessPurchaseTimeNode,
              ),
            const SizedBox(height: 20),
            _sectionHeader('Livestock Assets'),
            const SizedBox(height: 10),
            _dropdownField(
              controller.livestockController,
              onTap: controller.go2selectLivestock,
              node: controller.livestockNode,
              hintText: 'Please select the livestock you had!',
            ),
            if (controller.livestockController.text.trim().isNotEmpty && (controller.livestockController.text != 'None' && controller.livestockController.text != 'Nothing'))
              _livestockDetail(
                amountController: controller.livestockAmountController,
                priceController: controller.livestockUnitPriceController,
                totalValueController: controller.livestockTotalValueController,
                photos: controller.livestockPhotos,
                addAction: () => controller.addPhotoAction(PhotoUploadType.livestock),
                photoItemOnTap: (index) => controller.photoItemOnTap(index, type: PhotoUploadType.livestock),
              ),
            const SizedBox(height: 20),
            _sectionHeader('Vehicle'),
            const SizedBox(height: 10),
            _dropdownField(
              controller.vehicleController,
              onTap: controller.go2selectVehicle,
              node: controller.vehicleNode,
              hintText: 'Please select vehicle you had!',
            ),
            if (controller.vehicleController.text.trim().isNotEmpty && controller.vehicleController.text != 'None' && controller.vehicleController.text != 'Nothing')
              _vehicleDetail(
                purchasePriceController: controller.vehiclePurchasePriceController,
                purchaseDateController: controller.vehiclePurchaseDateController,
                marketValueController: controller.vehicleMarketValueController,
                photos: controller.vehiclePhotos,
                addAction: () => controller.addPhotoAction(PhotoUploadType.motorVehicles),
                itemOnTap: (index) => controller.photoItemOnTap(index, type: PhotoUploadType.motorVehicles),
                node: controller.vehiclePurchaseDateNode,
                dateSelectOnTap: () => controller.go2selectDate(SelectionDateType.vehicle),
              ),
            const SizedBox(height: 20),
            _sectionHeader('Shared class'),
            const SizedBox(height: 10),
            _subSection('Other Supporting Materials'),
            _itemTextField(controller.otherSupportingController, isEnable: true),
            _photoUploadItem(
              controller.otherAssetPhotos,
              addAction: () => controller.addPhotoAction(PhotoUploadType.other),
              itemOnTap: (index) => controller.photoItemOnTap(index, type: PhotoUploadType.other),
            ),
            const SizedBox(height: 20),
            _sectionHeader('Account Payee'),
            ...List.generate(controller.accountList.length, (index) => _accountItem(controller.accountList[index])),
            const SizedBox(height: 20),
            InkWell(
                onTap: controller.refuseLoanStatusChanged,
                child: Row(children: [
                  Icon(
                    controller.isRefuseLoan ? Icons.check_box_outlined : Icons.check_box_outline_blank_sharp,
                    color: controller.isRefuseLoan ? Global.instance.themeColor : Global.instance.textPrimaryColor,
                    size: 25,
                  ),
                  Text(
                    'Recommended to refuse loan',
                    style: TextStyle(color: controller.isRefuseLoan ? Global.instance.themeColor : Global.instance.textPrimaryColor, fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ])),
            const SizedBox(height: 10),
            _itemTextField(controller.refuseLoanReasonController, isEnable: controller.isRefuseLoan, isMultiLine: true, maxLines: 5),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: controller.interviewAction,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          'Interview',
                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: InkWell(
                      onTap: controller.reconsiderationAction,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          'Reconsideration',
                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _userInformationView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: GetBuilder<InterviewDetailController>(
          builder: (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(8)),
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Credit Limit    ', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                          Text('₱ ${controller.curDetailInfo.clientInfo.credit.amount}', style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(children: [
                        const Text('Credit Term    ', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                            child: Text('${controller.curDetailInfo.clientInfo.credit.loanDays} days/issue, ${controller.curDetailInfo.clientInfo.credit.insNum} issue in total',
                                style: TextStyle(color: Global.instance.themeColor, fontSize: 13, fontWeight: FontWeight.bold))),
                      ]),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  _sectionHeader('Photos'),
                  Row(children: [
                    Expanded(
                      child: SizedBox(
                        height: 145,
                        child: Column(children: [
                          Expanded(
                              child: CachedNetworkImage(
                                  imageUrl: controller.curDetailInfo.clientInfo.photos.identifyPhoto,
                                  placeholder: (context, xxx) => const Icon(Icons.image),
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.cover)),
                          Text('ID Photo Type: ${controller.curDetailInfo.clientInfo.photos.identityType}', style: TextStyle(color: Global.instance.textPrimaryColor))
                        ]),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 145,
                        child: Column(children: [
                          Expanded(
                              child: CachedNetworkImage(
                                  imageUrl: controller.curDetailInfo.clientInfo.photos.activityPhoto,
                                  placeholder: (context, xxx) => const Icon(Icons.image),
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.cover)),
                          Text('Facial Image', style: TextStyle(color: Global.instance.textPrimaryColor))
                        ]),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 10),
                  _sectionHeader('Basic Information'),
                  const SizedBox(height: 10),
                  _item('Name: ${controller.curDetailInfo.clientInfo.baseInfo.name}'),
                  _item('Gender: ${controller.curDetailInfo.clientInfo.baseInfo.gender}'),
                  _item('Birth Date: ${controller.curDetailInfo.clientInfo.baseInfo.birthday}'),
                  _item('ID Number: ${controller.curDetailInfo.clientInfo.baseInfo.idCardNumber}'),
                  _item('Degree: ${controller.curDetailInfo.clientInfo.baseInfo.educationBackground}'),
                  _item('Marital Status: ${controller.curDetailInfo.clientInfo.baseInfo.maritalStatus}'),
                  _item('Number of Children: ${controller.curDetailInfo.clientInfo.baseInfo.numberOfChildren}'),
                  _item('Uses of Loan: ${controller.curDetailInfo.clientInfo.baseInfo.usageOfLoan}'),
                  _item('Industry: ${controller.curDetailInfo.clientInfo.baseInfo.industryCategory}'),
                  _item('Salary: ${controller.curDetailInfo.clientInfo.baseInfo.monthlyIncome}'),
                  _item('Work Experience: ${controller.curDetailInfo.clientInfo.baseInfo.workingExperience}'),
                  _item('Payday: ${controller.curDetailInfo.clientInfo.baseInfo.payday}'),
                  _item('Residential Address: ${controller.residentialAddress}'),
                  _item('Residential Ownership: ${controller.curDetailInfo.clientInfo.baseInfo.residentialOwnership}'),
                  _item('Company Name: ${controller.curDetailInfo.clientInfo.baseInfo.companyName}'),
                  _item('Company Address: ${controller.companyAddress}'),
                  _item('Facebook Account: ${controller.curDetailInfo.clientInfo.baseInfo.facebookLink}'),
                  _item('Mobile Phone Number: ${controller.curDetailInfo.clientInfo.baseInfo.clientTel}'),
                  _item('Alternate Phone Number: ${controller.curDetailInfo.clientInfo.baseInfo.alterPhone}'),
                  _item('Viber: ${controller.curDetailInfo.clientInfo.baseInfo.viberPhone}'),
                  _item('Email Address: ${controller.curDetailInfo.clientInfo.baseInfo.email}'),
                ],
              )),
    );
  }

  Widget _sectionHeader(String title) {
    return Text(title, style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 15, fontWeight: FontWeight.bold));
  }

  Widget _subSection(String title) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Text(title, style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 15)),
    );
  }

  Widget _item(String text) {
    return Text(text, style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13));
  }

  Widget _itemTextField(TextEditingController controller, {bool isEnable = false, bool isMultiLine = false, int? maxLines}) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13),
      enabled: isEnable,
      maxLines: isMultiLine ? maxLines : 1,
      decoration: InputDecoration(
        isCollapsed: true,
        hintText: 'Please fill in',
        contentPadding: const EdgeInsets.all(8),
        hintStyle: TextStyle(color: HexColor('#cccccc')),
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: HexColor('#8591A7'), width: 1.0)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: HexColor('#8591A7'), width: 1.0)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Global.instance.themeColor, width: 1.0)),
      ),
    );
  }

  Widget _radioItem(String title, {void Function()? onTap, double? width, double? height, bool isChecked = false}) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: width,
            height: height,
            margin: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Icon(isChecked ? Icons.radio_button_checked : Icons.radio_button_off, size: 15, color: isChecked ? Global.instance.themeColor : Global.instance.textPrimaryColor),
                const SizedBox(width: 5),
                Text(title, style: TextStyle(color: isChecked ? Global.instance.themeColor : Global.instance.textPrimaryColor))
              ],
            )));
  }

  Widget _photoUploadItem(List<String> images, {void Function(int index)? itemOnTap, void Function()? addAction}) {
    double itemWidth = (MediaQuery.of(Get.context!).size.width - 40) / 3;
    double itemHeight = itemWidth * 0.7;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      _subSection('Photograph'),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          ...List.generate(
            images.length,
            (index) => InkWell(
              onTap: () => itemOnTap!(index),
              child: Container(
                width: itemWidth,
                height: itemHeight,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: CachedNetworkImage(
                  imageUrl: images[index],
                  placeholder: (context, text) => Icon(Icons.image, size: 70, color: Global.instance.themeColor),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: addAction,
            child: Container(
                width: itemWidth,
                height: itemHeight,
                decoration: BoxDecoration(
                  color: HexColor('#F1FAFF'),
                  border: Border.all(color: Global.instance.textPrimaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.add, size: 40, color: Global.instance.textPrimaryColor)),
          )
        ],
      )
    ]);
  }

  Widget _dropdownField(TextEditingController controller, {FocusNode? node, String? hintText, void Function()? onTap}) {
    return ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 35),
        child: TextField(
            readOnly: true,
            controller: controller,
            onTap: onTap,
            focusNode: node,
            style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13, fontWeight: FontWeight.normal),
            decoration: InputDecoration(
              isCollapsed: true,
              hintText: hintText,
              contentPadding: const EdgeInsets.all(8),
              hintStyle: TextStyle(color: HexColor('#CCCCCC'), fontSize: 13, fontWeight: FontWeight.normal),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Global.instance.textPrimaryColor, width: 1.0)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Global.instance.themeColor, width: 1.0)),
              suffixIcon: const Icon(Icons.keyboard_arrow_down, size: 20),
            )));
  }

  Widget _assetItem({
    required TextEditingController locationController,
    void Function()? locationOnTap,
    required TextEditingController fullAddressController,
    TextEditingController? estimatedAreaController,
    TextEditingController? timeOfPurchaseController,
    TextEditingController? priceController,
    required TextEditingController marketValueController,
    required List<String> photos,
    required void Function() photoAddAction,
    void Function(int index)? photoItemOnTap,
    void Function()? purchaseTimeOnTap,
    FocusNode? purchaseTimeNode,
    FocusNode? locationNode,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      _subSection('Geographical Location'),
      _dropdownField(locationController, onTap: locationOnTap, hintText: 'Please select your land asset location!', node: locationNode),
      _subSection('Full Address'),
      _itemTextField(fullAddressController, isEnable: true),
      if (estimatedAreaController != null) _subSection('Estimated Area'),
      if (estimatedAreaController != null) _itemTextField(estimatedAreaController, isEnable: true),
      if (timeOfPurchaseController != null) _subSection('Purchase Time'),
      if (timeOfPurchaseController != null)
        _dropdownField(
          timeOfPurchaseController,
          hintText: 'Please select your house purchase time!',
          onTap: purchaseTimeOnTap,
          node: purchaseTimeNode,
        ),
      if (priceController != null) _subSection('Purchase Price'),
      if (priceController != null) _itemTextField(priceController, isEnable: true),
      _subSection('Market Value'),
      _itemTextField(marketValueController, isEnable: true),
      _photoUploadItem(photos, addAction: photoAddAction, itemOnTap: photoItemOnTap)
    ]);
  }

  Widget _livestockDetail(
      {required TextEditingController amountController,
      required TextEditingController priceController,
      required TextEditingController totalValueController,
      required List<String> photos,
      void Function(int index)? photoItemOnTap,
      void Function()? addAction}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      _subSection('Amount'),
      _itemTextField(amountController, isEnable: true),
      _subSection('Estimated Unit Price'),
      _itemTextField(priceController, isEnable: true),
      _subSection('Total Market Value'),
      _itemTextField(totalValueController, isEnable: true),
      _photoUploadItem(photos, itemOnTap: photoItemOnTap, addAction: addAction),
    ]);
  }

  Widget _vehicleDetail({
    required TextEditingController purchasePriceController,
    required TextEditingController purchaseDateController,
    required TextEditingController marketValueController,
    void Function()? dateSelectOnTap,
    FocusNode? node,
    required List<String> photos,
    void Function()? addAction,
    void Function(int index)? itemOnTap,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      _subSection('Purchase Price'),
      _itemTextField(purchasePriceController, isEnable: true),
      _subSection('Purchase Date'),
      _dropdownField(purchaseDateController, hintText: "Please select your vehicle's purchase date!", onTap: dateSelectOnTap, node: node),
      _subSection('Market Value'),
      _itemTextField(marketValueController, isEnable: true),
      _photoUploadItem(photos, addAction: addAction, itemOnTap: itemOnTap)
    ]);
  }

  Widget _accountItem(InterviewDetailInfoInterviewInfoAccount account) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(color: HexColor('#F1FAFF'), borderRadius: BorderRadius.circular(8), border: Border.all(color: HexColor('#8290A7'))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: 65,
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(5)),
          child: Text(account.channelName, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
        ),
        Text(account.accountNo, style: TextStyle(color: Global.instance.themeColor, fontSize: 15, fontWeight: FontWeight.bold))
      ]),
    );
  }
}
