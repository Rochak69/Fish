import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
import 'package:fish_shop/ui/common_widget/app_dropdown.dart';
import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_bloc.dart';

import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_state.dart';
import 'package:fish_shop/ui/login/login.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FishFarmDetails extends StatefulWidget {
  const FishFarmDetails({super.key});

  @override
  State<FishFarmDetails> createState() => _FishFarmDetailsState();
}

class _FishFarmDetailsState extends State<FishFarmDetails> {
  final farmerNameController = TextEditingController();
  final toleNameController = TextEditingController();
  final emailController = TextEditingController();
  final facebookPageController = TextEditingController();
  final phoneNumberCOntroller = TextEditingController();
  final farmNameController = TextEditingController();
  String? selectedPradesh;
  String? selectedDistrict;
  String? selectedNagarpalika;
  String? selectedWoda;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FishFarmerDetailBloc, FishFarmerDetailState>(
      listener: (context, state) {
        Navigator.pop(context);
        if (state is FishFarmerDetailSuccess) {
          displayToastMessage('Farmer created successfully');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const LoginPage();
            },
          ));
        } else if (state is FishFarmerDetailFailed) {
          displayToastMessage(state.errorMessage,
              backgroundColor: AppColors.textRedContainerColor);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildUpperText(),
                    RichText(
                      text: TextSpan(
                          text: 'Farmer\'s name',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: [
                            TextSpan(
                                text: ' *',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16.sp))
                          ]),
                    ),
                    UiHelper.verticalSpacing(10.h),
                    FishTextField(
                      textEditingController: farmerNameController,
                      label: 'Farm\'s Name',
                      contentPadding: EdgeInsets.only(left: 15.w),
                    ),
                    UiHelper.verticalSpacing(10.h),
                    RichText(
                      text: TextSpan(
                          text: 'Farm Name',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: [
                            TextSpan(
                                text: ' *',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16.sp))
                          ]),
                    ),
                    UiHelper.verticalSpacing(10.h),
                    FishTextField(
                      textEditingController: farmNameController,
                      label: 'Farm\'s Name',
                      contentPadding: EdgeInsets.only(left: 15.w),
                    ),
                    UiHelper.verticalSpacing(10.h),
                    RichText(
                      text: TextSpan(
                          text: 'Phone Number',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: [
                            TextSpan(
                                text: ' *',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16.sp))
                          ]),
                    ),
                    UiHelper.verticalSpacing(10.h),
                    FishTextField(
                      textEditingController: phoneNumberCOntroller,
                      label: 'Phone Number',
                      contentPadding: EdgeInsets.only(left: 15.w),
                    ),
                    UiHelper.verticalSpacing(20.h),
                    Text(
                      'Farms\'s Address',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w700),
                    ),
                    UiHelper.verticalSpacing(15.h),
                    RichText(
                      text: TextSpan(
                          text: 'Pradesh',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: [
                            TextSpan(
                                text: ' *',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16.sp))
                          ]),
                    ),
                    UiHelper.verticalSpacing(8.h),
                    AppDropDown(
                      isExpanded: true,
                      dropdownValues: const ['Pradesh 1', 'Pradesh 2'],
                      onChanged: (p0) {},
                    ),
                    UiHelper.verticalSpacing(8.h),
                    RichText(
                      text: TextSpan(
                          text: 'District',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: [
                            TextSpan(
                                text: ' *',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16.sp))
                          ]),
                    ),
                    UiHelper.verticalSpacing(8.h),
                    AppDropDown(
                      isExpanded: true,
                      dropdownValues: const ['Pradesh 1', 'Pradesh 2'],
                      onChanged: (p0) {},
                    ),
                    UiHelper.verticalSpacing(10.h),
                    RichText(
                      text: TextSpan(
                          text: 'NagarPalika',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: [
                            TextSpan(
                                text: ' *',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16.sp))
                          ]),
                    ),
                    UiHelper.verticalSpacing(8.h),
                    AppDropDown(
                      isExpanded: true,
                      dropdownValues: const ['Pradesh 1', 'Pradesh 2'],
                      onChanged: (p0) {},
                    ),
                    UiHelper.verticalSpacing(16.h),
                    RichText(
                      text: TextSpan(
                          text: 'Woda',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: [
                            TextSpan(
                                text: ' *',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16.sp))
                          ]),
                    ),
                    UiHelper.verticalSpacing(8.h),
                    AppDropDown(
                      isExpanded: true,
                      dropdownValues: const ['Pradesh 1', 'Pradesh 2'],
                      onChanged: (p0) {},
                    ),
                    UiHelper.verticalSpacing(16.h),
                    Text(
                      'Tole Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    UiHelper.verticalSpacing(8.h),
                    FishTextField(
                      textEditingController: toleNameController,
                      label: 'Tole name',
                      contentPadding: EdgeInsets.only(left: 5.w),
                      width: double.infinity,
                    ),
                    UiHelper.verticalSpacing(16.h),
                    Text(
                      'Email',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    UiHelper.verticalSpacing(8.h),
                    FishTextField(
                      textEditingController: emailController,
                      label: 'Email',
                      contentPadding: EdgeInsets.only(left: 5.w),
                      width: double.infinity,
                    ),
                    UiHelper.verticalSpacing(16.h),
                    Text(
                      'Facebook page',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    UiHelper.verticalSpacing(8.h),
                    FishTextField(
                      textEditingController: facebookPageController,
                      label: 'Facebook Page',
                      contentPadding: EdgeInsets.only(left: 5.w),
                      width: double.infinity,
                    ),
                    UiHelper.verticalSpacing(22.h),
                    SizedBox(
                      width: 340.w,
                      height: 48.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ElevatedButton(
                          onPressed: () async {
                            Preferences preferences = Preferences();
                            String? userId =
                                await preferences.getString(Preference.userID);
                            if (userId == null) {
                              displayToastMessage('USerId is null');
                              return;
                            }
                            if (farmerNameController.text.isEmpty ||
                                farmNameController.text.isEmpty ||
                                phoneNumberCOntroller.text.isEmpty ||
                                selectedPradesh == null ||
                                selectedDistrict == null ||
                                selectedNagarpalika == null ||
                                selectedWoda == null) {
                              displayToastMessage('Please input all fields');
                              return;
                            }
                            showLoaderDialog(context);

                            // BlocProvider.of<FishFarmerDetailBloc>(context)
                            //     .add(PostFarmerDetailsEvent(
                            //   userId: userId,
                            //   pondSize: int.parse(pondSizeController.text),
                            //   farmName: farmerNameController.text,
                            //   district: districtController.text,
                            //   location: locationController.text,
                            //   woda: int.parse(woda.text),
                            //   locationKey: locationKey,
                            //   pradesh: pradeshController.text,
                            // ));
                            //HomeListing
                          },
                          child: Text(
                            'Send For Approval',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    UiHelper.verticalSpacing(30.h)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildUpperText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UiHelper.verticalSpacing(32.h),
        Text(
          'Fill in the details about your fish farm',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
        UiHelper.verticalSpacing(24.h),
      ],
    );
  }

  String getLocationKey(String selectedDropdownValue) {
    switch (selectedDropdownValue) {
      case 'Nagarpalika':
        // Handle Nagarpalika case
        print('nagarpalika');
        return 'nagarpalika';
      // "mahaNagarpalika": null,
      //     "upaMahaNagarpalika": null,
      //     "gaupalika": null,
      //     "nagarpalika": "Godawori"
      case 'Gaupalika':
        // Handle Gaupalika case
        print('gaupalika');
        return 'gaupalika';
      case 'Mahanagarpalika':
        // Handle Mahanagarpalika case
        print('mahaNagarpalika');
        return 'mahaNagarpalika';
      case 'Updamaharnagarpalika':
        // Handle Updamaharnagarpalika case
        print('upaMahaNagarpalika');
        return 'upaMahaNagarpalika';
      default:
        return 'nagarpalika';
    }
  }
}
