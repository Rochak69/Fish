import 'package:fish_shop/common/validator.dart';
import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
import 'package:fish_shop/ui/common_widget/app_dropdown.dart';
import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_bloc.dart';
import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_event.dart';

import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_state.dart';
import 'package:fish_shop/ui/fisher_farm_details/identication_documents.dart';
import 'package:fish_shop/ui/my_language/bloc/my_language_bloc.dart';
import 'package:fish_shop/ui/my_language/bloc/my_language_state.dart';
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
  final _formKey = GlobalKey<FormState>();

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
          return Scaffold(
            body: SafeArea(
              child: BlocBuilder<MyLanguageBloc, MyLanguageState>(
                builder: (context, languagetate) {
                  return SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildUpperText(),
                              RichText(
                                text: TextSpan(
                                    text: translation(context).farmer_name,
                                    //'Farmer\'s name',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp),
                                    children: [
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16.sp))
                                    ]),
                              ),
                              UiHelper.verticalSpacing(10.h),
                              FishTextField(
                                validator: (value) =>
                                    Validators.validateEmpty(value),
                                textEditingController: farmerNameController,
                                label: translation(context).farm_name,
                                // 'Farm\'s Name',
                                contentPadding: EdgeInsets.only(left: 15.w),
                              ),
                              UiHelper.verticalSpacing(10.h),
                              RichText(
                                text: TextSpan(
                                    text: translation(context).farm_name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp),
                                    children: [
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16.sp))
                                    ]),
                              ),
                              UiHelper.verticalSpacing(10.h),
                              FishTextField(
                                textEditingController: farmNameController,
                                label: translation(context).farm_name,
                                //'Farm\'s Name',
                                contentPadding: EdgeInsets.only(left: 15.w),
                              ),
                              UiHelper.verticalSpacing(10.h),
                              RichText(
                                text: TextSpan(
                                    text: translation(context).mobile_number,
                                    //'Phone Number',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp),
                                    children: [
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16.sp))
                                    ]),
                              ),
                              UiHelper.verticalSpacing(10.h),
                              FishTextField(
                                textEditingController: phoneNumberController,
                                label: translation(context).mobile_number,
                                //'Phone Number',
                                contentPadding: EdgeInsets.only(left: 15.w),
                              ),
                              UiHelper.verticalSpacing(20.h),
                              Text(
                                translation(context).farm_address,
                                //   'Farms\'s Address',
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
                                              color: Colors.red,
                                              fontSize: 16.sp))
                                    ]),
                              ),
                              UiHelper.verticalSpacing(8.h),
                              AppDropDown<String>(
                                value: selectedPradesh,
                                isExpanded: true,
                                items: state.provinceResponse
                                        ?.map((e) => DropdownMenuItem(
                                            value: e.id,
                                            child: Text(state is EnglishState
                                                ? e.englishName ?? ''
                                                : e.nepaliName ?? '')))
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
                                    text: translation(context).farmer_district,
                                    //'District',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp),
                                    children: [
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16.sp))
                                    ]),
                              ),
                              UiHelper.verticalSpacing(8.h),
                              AppDropDown<String>(
                                value: selectedDistrict,
                                isExpanded: true,
                                items: state.districtResponse
                                        ?.map((e) => DropdownMenuItem(
                                            value: e.id,
                                            child: Text(state is EnglishState
                                                ? e.englishName ?? ''
                                                : e.nepaliName ?? '')))
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
                                    text: translation(context).palika,
                                    // 'NagarPalika',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp),
                                    children: [
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16.sp))
                                    ]),
                              ),
                              UiHelper.verticalSpacing(8.h),
                              AppDropDown<String>(
                                value: selectedNagarpalika,
                                isExpanded: true,
                                items: state.municipalityResponse
                                        ?.map((e) => DropdownMenuItem(
                                            value: e.id,
                                            child: Text(state is EnglishState
                                                ? e.englishName ?? ''
                                                : e.nepaliName ?? '')))
                                        .toList() ??
                                    [],
                                onChanged: (value) {
                                  selectedNagarpalika = value;
                                  setState(() {});
                                  BlocProvider.of<FishFarmerDetailBloc>(context)
                                      .add(GetWoda(
                                          municipalityId:
                                              selectedNagarpalika ?? '1'));
                                },
                              ),
                              UiHelper.verticalSpacing(16.h),
                              RichText(
                                text: TextSpan(
                                    text: translation(context).woda,
                                    //'Woda',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp),
                                    children: [
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16.sp))
                                    ]),
                              ),
                              UiHelper.verticalSpacing(8.h),
                              AppDropDown<String>(
                                value: selectedWoda,
                                isExpanded: true,
                                items: state.wodaResponse
                                        ?.map((e) => DropdownMenuItem(
                                            value: e.id,
                                            child: Text(state is EnglishState
                                                ? e.englishNumber ?? ''
                                                : e.nepaliNumber ?? '')))
                                        .toList() ??
                                    [],
                                onChanged: (value) {
                                  selectedWoda = value;
                                  setState(() {});
                                },
                              ),
                              UiHelper.verticalSpacing(16.h),
                              Text(
                                translation(context).tole,
                                //   'Tole Name',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp),
                              ),
                              UiHelper.verticalSpacing(8.h),
                              FishTextField(
                                textEditingController: toleNameController,
                                label: translation(context).tole,
                                //'Tole name',
                                contentPadding: EdgeInsets.only(left: 5.w),
                                width: double.infinity,
                              ),
                              UiHelper.verticalSpacing(16.h),
                              Text(
                                translation(context).email,
                                // 'Email',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp),
                              ),
                              UiHelper.verticalSpacing(8.h),
                              FishTextField(
                                textEditingController: emailController,
                                label: translation(context).email,
                                //'Email',
                                contentPadding: EdgeInsets.only(left: 5.w),
                                width: double.infinity,
                              ),
                              UiHelper.verticalSpacing(16.h),
                              Text(
                                translation(context).facebook_page,
                                // 'Facebook page',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp),
                              ),
                              UiHelper.verticalSpacing(8.h),
                              FishTextField(
                                textEditingController: facebookPageController,
                                label: translation(context).facebook_page,
                                //'Facebook Page',
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

                                      if (_formKey.currentState!.validate()) {
                                        if (selectedPradesh == null ||
                                            selectedDistrict == null ||
                                            selectedNagarpalika == null ||
                                            selectedWoda == null) {
                                          displayToastMessage(
                                              'Please input location details');
                                          return;
                                        }

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  IdentificationDocuments(
                                                userId: userId,
                                                farmName:
                                                    farmerNameController.text,
                                                farmersName:
                                                    farmerNameController.text,
                                                phoneNumber:
                                                    phoneNumberController.text,
                                                toleName:
                                                    toleNameController.text,
                                                email: emailController.text,
                                                facebook:
                                                    facebookPageController.text,
                                                district: selectedDistrict!,
                                                nagarpalika:
                                                    selectedNagarpalika!,
                                                pradesh: selectedPradesh!,
                                                woda: selectedWoda!,
                                              ),
                                            ));
                                      }
                                    },
                                    child: Text(
                                      'Next',
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
                  );
                },
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
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
          translation(context).farmer_details,
          //'Fill in the details about your fish farm',
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
