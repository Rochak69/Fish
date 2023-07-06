import 'package:fish_shop/common/validator.dart';
import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
import 'package:fish_shop/ui/common_widget/app_dropdown.dart';
import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_bloc.dart';
import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_event.dart';

import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_state.dart';
import 'package:fish_shop/ui/fisher_farm_details/identication_documents.dart';
import 'package:fish_shop/ui/fisher_farm_details/model/dropdown_id_name.dart';
import 'package:fish_shop/ui/login/login.dart';
import 'package:fish_shop/ui/my_language/bloc/my_language_bloc.dart';
import 'package:fish_shop/ui/my_language/bloc/my_language_event.dart';
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
  final phoneNumberController = TextEditingController();
  final farmNameController = TextEditingController();
  String? selectedPradesh;
  String? selectedDistrict;
  String? selectedNagarpalika;
  String? selectedWoda;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<FishFarmerDetailBloc>(context).add(GetProvince());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FishFarmerDetailBloc, FishFarmerDetailState>(
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          return WillPopScope(
            onWillPop: () async {
              return false;
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
                            validator: (value) =>
                                Validator.validateEmpty(value),
                            textEditingController: farmerNameController,
                            label: 'Farm\'s Name',
                            contentPadding: EdgeInsets.only(left: 15.w),
                          ),
                          UiHelper.verticalSpacing(10.h),
                          RichText(
                            text: TextSpan(
                                text: translation(context).hello,
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
                            validator: (value) =>
                                Validator.validateEmpty(value),
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
                            validator: (value) =>
                                Validator.validateEmpty(value),
                            textEditingController: phoneNumberController,
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
                                text: translation(context).pradesh,
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
                          AppDropDown<String>(
                            value: selectedPradesh,
                            isExpanded: true,
                            items: state.provinceResponse
                                    ?.map((e) => DropdownMenuItem(
                                        value: e.id,
                                        child: Text(e.englishName!)))
                                    .toList() ??
                                [],
                            onChanged: (value) {
                              selectedPradesh = value;
                              setState(() {});

                              BlocProvider.of<FishFarmerDetailBloc>(context)
                                  .add(GetDistrict(
                                      provinceId: selectedPradesh ?? '1'));
                            },
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
                          AppDropDown<String>(
                            value: selectedDistrict,
                            isExpanded: true,
                            items: state.districtResponse
                                    ?.map((e) => DropdownMenuItem(
                                        value: e.id,
                                        child: Text(e.englishName!)))
                                    .toList() ??
                                [],
                            onChanged: (value) {
                              selectedDistrict = value;
                              setState(() {});
                              BlocProvider.of<FishFarmerDetailBloc>(context)
                                  .add(GetMunicipality(
                                      districtId: selectedDistrict ?? '1'));
                            },
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
                          AppDropDown<String>(
                            value: selectedNagarpalika,
                            isExpanded: true,
                            items: state.municipalityResponse
                                    ?.map((e) => DropdownMenuItem(
                                        value: e.id,
                                        child: Text(e.englishName!)))
                                    .toList() ??
                                [],
                            onChanged: (value) {
                              selectedNagarpalika = value;
                              setState(() {});
                            },
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
                          AppDropDown<String>(
                            value: selectedWoda,
                            isExpanded: true,
                            items: state.provinceResponse
                                    ?.map((e) => DropdownMenuItem(
                                        value: e.id,
                                        child: Text(e.englishName!)))
                                    .toList() ??
                                [],
                            onChanged: (value) {
                              selectedWoda = value;
                              setState(() {});
                            },
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
                              borderRadius: BorderRadius.circular(12.r),
                              child: ElevatedButton(
                                onPressed: () async {
                                  Preferences preferences = Preferences();
                                  String? userId = await preferences
                                      .getString(Preference.userID);
                                  if (userId == null) {
                                    displayToastMessage('USerId is null');
                                    return;
                                  }
                                  if (farmerNameController.text.isEmpty ||
                                      farmNameController.text.isEmpty ||
                                      phoneNumberController.text.isEmpty ||
                                      selectedPradesh == null ||
                                      selectedDistrict == null ||
                                      selectedNagarpalika == null ||
                                      selectedWoda == null) {
                                    displayToastMessage(
                                        'Please input all fields');
                                    return;
                                  }

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            IdentificationDocuments(
                                          userId: userId,
                                          farmName: farmerNameController.text,
                                          farmersName:
                                              farmerNameController.text,
                                          phoneNumber:
                                              phoneNumberController.text,
                                          district: selectedDistrict!,
                                          nagarpalika: selectedNagarpalika!,
                                          pradesh: selectedPradesh!,
                                          woda: selectedWoda!,
                                        ),
                                      ));
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
        return Scaffold(
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
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
}
